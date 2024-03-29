//
//  ActionButton.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import SwiftUI

struct ActionButton: View {
    let title: String
    let backgroundColor: Color
    let foregroundColor: Color
    var isDisabled: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding(.vertical, 10)
                .foregroundStyle(foregroundColor)
                .font(.system(size: 20))
                .frame(maxWidth: .infinity)
                .fontWeight(.semibold)
                .background(isDisabled ? .gray : backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .disabled(isDisabled)
    }
}

#Preview {
    ActionButton(title: "Register", 
                 backgroundColor: .blue,
                 foregroundColor: .white) {
        print("Test")
    }
}
