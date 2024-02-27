//
//  ImageManager.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 27.02.24.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    let apiKey = "42574921-13e27f24a2bd05eabb3a193ce"
    
    func fetchImages(forCategory category: String) async throws -> [ImageModel] {
        guard let query = category.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://pixabay.com/api/?key=\(apiKey)&q=\(query)&image_type=photo&per_page=50&safesearch=true") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decodedResponse = try JSONDecoder().decode(PixabayResponse.self, from: data)
        return decodedResponse.hits
    }
    
    func downloadImage(from url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
    
}


