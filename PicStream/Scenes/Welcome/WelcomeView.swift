//
//  ContentView.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            content
        }
    }
    
    private var content: some View {
        VStack(spacing: 30) {
            heroImage
            welcomeText
            authButtons
            Spacer()
        }
        .padding(.horizontal, 36)
        .padding(.vertical, 64)
    }
    
    private var heroImage: some View {
        Image(.welcome)
            .resizable()
            .scaledToFit()
            .frame(height: 264)
    }
    
    private var welcomeText: some View {
        VStack(spacing: 12) {
            Text("Hello, welcome!")
                .font(.system(size: 24))
                .fontWeight(.semibold)
            
            Text("Log in or create an account!")
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundStyle(.secondaryGray)
        }
        .padding(.bottom, 10)
    }
    
    private var authButtons: some View {
        VStack(spacing: 12) {
            registerButton
            DividerWithText()
            loginButton
        }
    }
    
    private var registerButton: some View {
        ActionButton(title: "Register",
                     backgroundColor: .customBlue,
                     foregroundColor: .white) {
            print("Register")
        }
        
    }
    
    private var loginButton: some View {
        ActionButton(title: "Login",
                     backgroundColor: .secondaryWhite,
                     foregroundColor: .secondaryGray) {
            print("Login")
        }
    }
    
    private func DividerWithText() -> some View {
        HStack {
            Line()
            Text("or")
                .fontWeight(.medium)
                .foregroundColor(.gray)
            Line()
        }
    }
}

#Preview {
    WelcomeView()
}
