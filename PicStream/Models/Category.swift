//
//  Category.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 27.02.24.
//

import Foundation

struct Category: Identifiable {
    let id: UUID
    let name: String
    
    static let allCategories = [
        Category(name: "Nature"),
        Category(name: "Tech"),
        Category(name: "Art"),
        Category(name: "Space"),
        Category(name: "Architecture")
    ]
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}
