//
//  RegistrationView.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 27.02.24.
//

import SwiftUI

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
    @State var age = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                
                content
            }
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
    
    private var registrationFields: some View {
        VStack(spacing: 20) {
            RoundedTextField(text: $email, placeholder: "Enter your email", icon: .envelope)
            RoundedTextField(text: $age, placeholder: "Enter your age", icon: .calendar)
            RoundedTextField(text: $password, placeholder: "Enter your password", icon: .lock, isSecure: true)
        }
    }
    
    private var registerButton: some View {
        ActionButton(title: "Register", backgroundColor: .customBlue, foregroundColor: .white) {
            // MARK: - Handle Register
        }
    }
    
}

#Preview {
    RegistrationView()
}
