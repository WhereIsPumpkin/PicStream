//
//  RoundedTextField.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import SwiftUI

struct RoundedTextField: View {
    @Binding var text: String
    var placeholder: String
    var icon: String
    var keyboardType: UIKeyboardType = .default
    var isSecure = false
    var isError = false
    
    var body: some View {
        HStack {
            Group {
                if isSecure {
                    SecureField("", text: $text, prompt: Text(placeholder).foregroundStyle(.textFieldText))
                } else {
                    TextField("", text: $text, prompt: Text(placeholder).foregroundStyle(.textFieldText))
                }
            }
            
            Image(systemName: icon)
                .scaleEffect(1.2)
                .foregroundStyle(.textFieldText)
        }
        .padding(.leading, 20)
        .padding(.trailing, 16)
        .keyboardType(keyboardType)
        .frame(height: 50)
        .background(.textFieldBackground.opacity(0.2))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(isError ? Color.red : Color.clear, lineWidth: 4))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    RoundedTextField(text: .constant(""), 
                     placeholder: "Enter your email", 
                     icon: "envelope.fill")
}
