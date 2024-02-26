//
//  View+Extensions.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import SwiftUI

extension View {
    func Line() -> some View {
        VStack {
            Divider().background(Color.gray)
        }.frame(height: 1)
    }
}
