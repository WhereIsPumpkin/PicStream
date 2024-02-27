//
//  Image.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 27.02.24.
//

import Foundation

struct PixabayResponse: Decodable {
    let hits: [ImageModel]
}

struct ImageModel: Identifiable, Decodable, Hashable {
    let id: Int
    let webformatURL: String
    let user: String
    let imageWidth: Int
    let imageHeight: Int
    let tags: String
    let views: Int
    let downloads: Int
    let likes: Int
    let comments: Int
    let userImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case webformatURL
        case user
        case imageWidth
        case imageHeight
        case tags
        case views
        case downloads
        case likes
        case comments
        case userImageURL = "userImageURL"
    }
}

/// mock data for previews
extension ImageModel {
    static let example = ImageModel(
        id: 123456,
        webformatURL: "https://pixabay.com/get/gdb761689fc0637609821e87452bf8a22b4c7044b65f44e213f50b4a23c851d59ecaad1853e6c2125531d31f44e0ac029_640.jpg",
        user: "SampleUser",
        imageWidth: 1920,
        imageHeight: 1080,
        tags: "Nature, Sunset, Mountains",
        views: 1000,
        downloads: 500,
        likes: 99,
        comments: 10,
        userImageURL: "https://cdn.pixabay.com/user/2014/02/10/02-47-32-118_250x250.jpg"
    )
}
