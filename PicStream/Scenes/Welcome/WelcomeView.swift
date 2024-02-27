//
//  ContentView.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import SwiftUI

struct WelcomeView: View {
    
    // MARK: - Properties
    @EnvironmentObject var router: Router
    
    // MARK: - Body
    var body: some View {
        mainContent
    }
    
    // MARK: - UI Components
    private var mainContent: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            mainViewContent
        }
    }
    
    private var mainViewContent: some View {
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
        WelcomeText(title: "Hello, welcome!",
                    subtitle: "Log in or create an account!" )
    }
    
    private var authButtons: some View {
        VStack(spacing: 12) {
            registerButton
            DividerWithText()
            loginButton
        }
    }
    
    private var registerButton: some View {
        ActionButton(title: "Login",
                     backgroundColor: .customBlue,
                     foregroundColor: .white) {
            router.navigate(to: .login)
        }
        
    }
    
    private var loginButton: some View {
        ActionButton(title: "Register",
                     backgroundColor: .secondaryWhite,
                     foregroundColor: .secondaryGray) {
            router.navigate(to: .register)
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
        .environmentObject(Router())
}
