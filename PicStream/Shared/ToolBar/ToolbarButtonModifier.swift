//
//  ToolbarButtonModifier.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 27.02.24.
//

import SwiftUI

struct ToolbarButtonModifier: ViewModifier {
    var title: String
    var action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(title, action: action)
                }
            }
    }
}

extension View {
    func toolbarButton(title: String, action: @escaping () -> Void) -> some View {
        self.modifier(ToolbarButtonModifier(title: title, action: action))
    }
}

