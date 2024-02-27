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

struct ImageModel: Identifiable, Decodable {
    let id: Int
    let webformatURL: String
    let user: String

    enum CodingKeys: String, CodingKey {
        case id
        case webformatURL = "webformatURL"
        case user
    }
}
