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
    
    var body: some View {
        HStack {
            TextField("", text: $text, prompt: Text(placeholder).foregroundStyle(.textFieldText))
            
            Image(systemName: icon)
                .scaleEffect(1.2)
                .foregroundStyle(.textFieldText)
        }
        .padding(.leading, 20)
        .padding(.trailing, 16)
        .frame(height: 50)
        .background(.textFieldBackground.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    RoundedTextField(text: .constant(""), 
                     placeholder: "Enter your email", 
                     icon: "envelope.fill")
}
