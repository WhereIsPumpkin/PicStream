//
//  WelcomeText.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import SwiftUI

struct WelcomeText: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.system(size: 24))
                .fontWeight(.semibold)

            Text(subtitle)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundStyle(.secondaryGray)
        }
        .padding(.bottom, 10)
    }
}


#Preview {
    WelcomeText(title: "test", subtitle: "TEst")
}
