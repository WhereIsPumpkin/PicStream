//
//  MainPageViewModel.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 27.02.24.
//

import Foundation

final class MainPageViewModel: ObservableObject {
    @Published var images: [ImageModel] = []
    
    func fetchImages(forCategory category: String) {
        Task {
            do {
                let fetchedImages = try await ImageManager.shared.fetchImages(forCategory: category)
                
                DispatchQueue.main.async { [weak self] in
                    self?.images = fetchedImages
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
