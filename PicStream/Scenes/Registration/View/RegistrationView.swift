//
//  RegistrationView.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 27.02.24.
//

import SwiftUI

struct RegistrationView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = RegistrationViewModel()
    @EnvironmentObject var router: Router
    
    // MARK: - Body
    var body: some View {
            ZStack {
                Color.background.ignoresSafeArea()
                content
            }
            .toolbarButton(title: "Login") {
                router.navigateToRoot()
                router.navigate(to: .login)
            }
    }
    
    // MARK: - UI Components
    private var content: some View {
        VStack(spacing: 32) {
            heroImage
            welcomeText
            registrationFields
            Spacer()
            registerButton
            
        }
        .padding(36)
    }
    
    private var heroImage: some View {
        Image(.register)
            .resizable()
            .scaledToFit()
            .frame(height: 144)
    }
    
    private var welcomeText: some View {
        WelcomeText(title: "Get Started!",
                    subtitle: "by creating a free ccount")
    }
    
    private var emailField: some View {
        VStack(spacing: 8) {
            RoundedTextField(text: $viewModel.email, placeholder: "Enter your email", icon: .envelope, isError: viewModel.emailErrorMessage != nil)
            ErrorMessageView(message: viewModel.emailErrorMessage)
        }
    }
    
    private var ageField: some View {
        VStack(spacing: 8) {
            RoundedTextField(text: $viewModel.age.max(2), placeholder: "Enter your age", icon: .calendar, keyboardType: .numberPad, isError: viewModel.ageErrorMessage != nil)
            ErrorMessageView(message: viewModel.ageErrorMessage)
        }
    }
    
    private var passwordField: some View {
        VStack(spacing: 8) {
            RoundedTextField(text: $viewModel.password, placeholder: "Enter your password", icon: .lock, isSecure: true, isError: viewModel.passwordErrorMessage != nil)
            ErrorMessageView(message: viewModel.passwordErrorMessage)
        }
    }
    
    private var registrationFields: some View {
        VStack(spacing: 20) {
            emailField
            ageField
            passwordField
        }
    }
    
    private var registerButton: some View {
        ActionButton(title: "Register", backgroundColor: .customBlue, foregroundColor: .white, isDisabled: !viewModel.isRegisterEnabled) {
            Task {
                await viewModel.register()
                if viewModel.registrationSuccess {
                    router.navigate(to: .mainPage)
                }
            }
        }
    }
    
    
}

#Preview {
    RegistrationView()
}
