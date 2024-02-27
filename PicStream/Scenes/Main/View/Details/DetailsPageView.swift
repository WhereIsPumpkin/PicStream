//
//  DetailsPageView.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 27.02.24.
//

import SwiftUI

import SwiftUI

struct DetailPageView: View {
    let image: ImageModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Safely unwrap the main image URL
                if let mainImageUrl = URL(string: image.webformatURL) {
                    CachedImageView(url: mainImageUrl)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                } else {
                    // Fallback view in case URL is nil
                    Image(systemName: "photo")
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
                
                Text("Dimensions: \(image.imageWidth)x\(image.imageHeight)")
                    .font(.headline)
                    .padding(.bottom, 1)
                
                Text("Type: Photo")
                    .font(.subheadline)
                    .padding(.bottom, 1)
                
                Text("Tags: \(image.tags)")
                    .font(.subheadline)
                    .padding(.bottom, 1)
                
                Divider()
                
                HStack {
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
                    
                    VStack(alignment: .leading) {
                        Text(image.user)
                            .font(.title3)
                            .fontWeight(.medium)
                        Text("Views: \(image.views)")
                            .font(.caption)
                        Text("Downloads: \(image.downloads)")
                            .font(.caption)
                    }
                    .padding(.leading, 10)
                }
                
                Group {
                    Text("Likes: \(image.likes)")
                    Text("Comments: \(image.comments)")
                }
                .font(.subheadline)
                .padding(.top, 1)
            }
            .padding()
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Preview
struct DetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPageView(image: ImageModel.example)
    }
}

// Preview
#Preview {
    DetailPageView(image: ImageModel.example)
}

