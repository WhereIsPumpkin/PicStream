//
//  LoginView.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            content
        }
    }
    
    private var content: some View {
        VStack(spacing: 32) {
            heroImage
            welcomeText
            authFields
            Spacer()
            loginButton
        }
        .padding(.horizontal, 36)
        .padding(.vertical, 32)
    }
    
    private var heroImage: some View {
        Image(.camera)
            .resizable()
            .scaledToFit()
            .frame(height: 144)
    }
    
    private var welcomeText: some View {
        WelcomeText(title: "Welcome back!",
                    subtitle: "sign in to acces your account")
    }
    
    private var authFields: some View {
        VStack(spacing: 24) {
            RoundedTextField(text: $viewModel.email,
                             placeholder: "Enter your email",
                             icon: .envelope)
            
            RoundedTextField(text: $viewModel.password,
                             placeholder: "Enter your email",
                             icon: .lock )
        }
    }
    
    private var loginButton: some View {
        ActionButton(title: "Login",
                     backgroundColor: .customBlue,
                     foregroundColor: .white) {
            Task {
                await viewModel.login()
            }
        }
    }
    
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}

// Example MainPageView placeholder
struct MainPageView: View {
    var body: some View {
        Text("Main Page")
    }
}
