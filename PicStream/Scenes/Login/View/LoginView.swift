//
//  LoginView.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    @StateObject var viewModel = LoginViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                
                content
            }
            .navigationDestination(isPresented: $viewModel.canNavigateToMainPage) {
                MainPageView()
            }
        }
    }
    
    // MARK: - UI Components
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
        VStack(alignment: .leading, spacing: 12) {
            VStack(spacing: 24) {
                RoundedTextField(text: $viewModel.email,
                                 placeholder: "Enter your email",
                                 icon: "envelope.open.fill",
                                 isError: viewModel.isDisplayingError)
                
                RoundedTextField(text: $viewModel.password,
                                 placeholder: "Enter your password",
                                 icon: "lock.fill",
                                 isSecure: true, 
                                 isError: viewModel.isDisplayingError)
            }
            
            errorMessage
        }
    }
    
    private var errorMessage: some View {
        HStack {
            if viewModel.isDisplayingError {
                Text(viewModel.lastErrorMessage)
                    .foregroundColor(.red)
                    .font(.system(size: 12))
            }
        }
    }
    
    private var loginButton: some View {
        ActionButton(title: "Login", backgroundColor: .customBlue,foregroundColor: .white, isDisabled: !viewModel.isLoginEnabled) {
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
