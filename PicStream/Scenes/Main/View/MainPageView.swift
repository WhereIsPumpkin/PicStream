//
//  MangePageView.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 27.02.24.
//

import SwiftUI

struct MainPageView: View {
    // MARK: - Properties
    @State private var selectedCategoryId: UUID?
    private let categories = Category.allCategories
    @StateObject private var viewModel = MainPageViewModel()
    private let gridItems = [ GridItem(.adaptive(minimum: 144), spacing: 12)]
    
    // MARK: - Initialization
    init() {
        _selectedCategoryId = State(initialValue: categories.first?.id)
    }
    
    // MARK: - Body
    var body: some View {
            ZStack {
                Color.background.ignoresSafeArea()
                content
            }
            .onAppear {
                if let firstCategory = categories.first {
                    viewModel.fetchImages(forCategory: firstCategory.name)
                }
            }
    }

    
    // MARK: - Computed Properties
    private var content: some View {
        ScrollView {
            heroText
            categoriesScrollView
            imagesGrid
            Spacer()
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal, 24)
        .padding(.vertical, 32)
        .navigationBarBackButtonHidden(true)
    }
    
    private var heroText: some View {
        HStack {
            Text("Explore")
                .font(.title)
                .fontWeight(.semibold)
                .kerning(2)
            Spacer()
        }
    }
    
    private var categoriesScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 20) {
                ForEach(categories) { category in
                    categoryText(for: category)
                }
            }
            .padding(.vertical)
        }
    }
    
    private func categoryText(for category: Category) -> some View {
        VStack(alignment: .leading) {
            Text(category.name)
                .fontWeight(selectedCategoryId == category.id ? .bold : .regular)
                .foregroundColor(selectedCategoryId == category.id ? .black : .gray)
                .onTapGesture {
                    self.selectedCategoryId = category.id
                    viewModel.fetchImages(forCategory: category.name)
                }
            
            if selectedCategoryId == category.id {
                Circle()
                    .frame(width: 8)
            }
        }
    }
    
    private var imagesGrid: some View {
        LazyVGrid(columns: gridItems, spacing: 20) {
            imageContent
        }
    }
    
    private var imageContent: some View {
        ForEach(viewModel.images, id: \.id) { imageModel in
            if let imageURL = URL(string: imageModel.webformatURL) {
                NavigationLink(destination: DetailPageView(image: imageModel)) {
                    CachedImageView(url: imageURL)
                        .aspectRatio(4/5, contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
    }
    
}

#Preview {
    MainPageView()
}
