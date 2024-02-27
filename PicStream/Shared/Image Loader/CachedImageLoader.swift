//
//  AsyncImageLoader.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 27.02.24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CachedImageView: View {
    let url: URL

    var body: some View {
        WebImage(url: url)
            .resizable()
            .indicator(.progress) 
            .transition(.fade(duration: 0.5))
    }
}

