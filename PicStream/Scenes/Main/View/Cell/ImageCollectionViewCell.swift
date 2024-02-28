//
//  ImageCollectionViewCell.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 28.02.24.
//

import UIKit
import SDWebImage

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ImageCollectionViewCell"
    
    private var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with url: URL) {
        imageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "photo"))
    }
    
    private func setupImageView() {
        imageView = UIImageView()
        addSubview(imageView)
        setupImageViewAppearance()
        setupImageViewConstraints()
    }
    
    private func setupImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func setupImageViewAppearance() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
    }
}
