//
//  ImageCollectionView.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 28.02.24.
//

import SwiftUI
import UIKit

struct ImageCollectionView: UIViewRepresentable {
    @Binding var images: [ImageModel]
    @Binding var selectedImage: ImageModel?
    
    func makeUIView(context: Context) -> UICollectionView {
        return createCollectionView(context: context)
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {
        uiView.reloadData()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
        
        var parent: ImageCollectionView
        
        init(_ parent: ImageCollectionView) {
            self.parent = parent
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            parent.images.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
            let image = parent.images[indexPath.item]
            
            if let url = URL(string: image.webformatURL) {
                cell.configure(with: url)
            }
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let image = parent.images[indexPath.item]
            parent.selectedImage = image
        }
    }
}

extension ImageCollectionView {
    func createCollectionView(context: Context) -> UICollectionView {
        let layout = UICollectionViewFlowLayout.customLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = context.coordinator
        collectionView.delegate = context.coordinator
        return collectionView
    }
}

extension UICollectionViewFlowLayout {
    static func customLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let screenWidth = UIScreen.main.bounds.width
        let padding: CGFloat = 32.0 * 2
        let adjustedWidth = (screenWidth - padding) / 2
        
        layout.itemSize = CGSize(width: adjustedWidth, height: 180)
        return layout
    }
}
