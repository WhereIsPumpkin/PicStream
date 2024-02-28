//
//  ImageCollectionViewCell.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 28.02.24.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ImageCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("I'm initialized")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with url: URL) {
        print(url)
    }
}
