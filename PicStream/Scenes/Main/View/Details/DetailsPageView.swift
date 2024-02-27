//
//  DetailsPageView.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 27.02.24.
//

import SwiftUI

struct DetailPageView: View {
    // MARK: - Properties
    let image: ImageModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            scrollableContent
        }
    }
    
    // MARK: - UI Components
    private var scrollableContent: some View {
        ScrollView {
            content
        }
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 20) {
            imageSection
            detailSection
            divider
            userSection
            statsSection
        }
        .padding()
    }
    
    private var imageSection: some View {
        Group {
            if let mainImageUrl = URL(string: image.webformatURL) {
                CachedImageView(url: mainImageUrl)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(12)
                    .shadow(radius: 5)
            } else {
                Image(systemName: .photo)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(12)
                    .shadow(radius: 5)
            }
        }
        
    }
    
    private var detailSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Dimensions: \(image.imageWidth) x \(image.imageHeight)").font(.headline)
            Text("Type: Photo").font(.subheadline)
            tagsView.padding(.top, 1)
        }
    }
    
    private var divider: some View {
        Divider()
            .padding(.vertical)
    }
    
    private var userSection: some View {
        HStack {
            userProfileImage
            VStack(alignment: .leading, spacing: 5) {
                Text(image.user).font(.title3).fontWeight(.medium)
            }
            .padding(.leading, 10)
        }
    }
    
    private var statsSection: some View {
        HStack {
            customIconLabel(iconName: "heart.fill", text: "\(image.likes)", color: .red)
            customIconLabel(iconName: "text.bubble.fill", text: "\(image.comments)", color: .blue)
            Spacer()
            customIconLabel(iconName: "eye.fill", text: "\(image.views)", color: .orange)
            customIconLabel(iconName: "arrow.down.circle.fill", text: "\(image.downloads)", color: .green)
        }
        .padding(.top, 1)
    }
    
    private var tagsView: some View {
        HStack {
            ForEach(image.tags.components(separatedBy: ","), id: \.self) { tag in
                Text(tag)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(20)
            }
        }
    }
    
    private var userProfileImage: some View {
        Group {
            if let userImageUrl = URL(string: image.userImageURL) {
                CachedImageView(url: userImageUrl)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .shadow(radius: 3)
            } else {
                Image(systemName: "person.fill")
                    .foregroundColor(.gray)
                    .frame(width: 50, height: 50)
                    .background(Color.gray.opacity(0.3))
                    .clipShape(Circle())
            }
        }
    }
    
    private func customIconLabel(iconName: String, text: String, color: Color) -> some View {
        HStack(spacing: 5) {
            Image(systemName: iconName)
                .foregroundColor(color)
            Text(text)
        }
        .font(.subheadline)
    }
}

#Preview {
    NavigationStack {
        DetailPageView(image: ImageModel.example)
    }
}

