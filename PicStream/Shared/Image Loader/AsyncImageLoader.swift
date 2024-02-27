//
//  AsyncImageLoader.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 27.02.24.
//

import SwiftUI

struct AsyncImageLoaderView: View {
    let url: URL
    @State private var image: UIImage? = nil
    
    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
        } else {
            ProgressView()
                .onAppear {
                    Task {
                        do {
                            let imageData = try await ImageManager.shared.downloadImage(from: url)
                            self.image = UIImage(data: imageData)
                        } catch {
                            print("Error downloading image: \(error)")
                        }
                    }
                }
        }
    }
}

#Preview {
    AsyncImageLoaderView(url: URL(string: "https://pixabay.com/get/gd9f395c15e99d7880c816a03b5984f704563ea39283d0b8ad28c26cd6d3a2ae551700ad36d14481966df23520dd7a580e840ad7f263b0e2f9e704e72d150eb60_640.jpg")!)
}
