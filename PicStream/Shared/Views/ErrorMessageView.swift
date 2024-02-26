//
//  ErrorMessageView.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 27.02.24.
//

import SwiftUI

struct ErrorMessageView: View {
    var message: String?
    
    var body: some View {
        if let message = message {
            HStack {
                Text(message)
                    .foregroundColor(.red)
                    .font(.system(size: 12))
                Spacer()
            }
        }
    }
}

#Preview {
    ErrorMessageView()
}
