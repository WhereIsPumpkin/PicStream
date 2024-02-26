//
//  LoginView.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
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
            RoundedTextField(text: $email,
                             placeholder: "Enter your email",
                             icon: .envelope)
            
            RoundedTextField(text: $password,
                             placeholder: "Enter your email",
                             icon: .lock )
        }
    }
    
    private var loginButton: some View {
        ActionButton(title: "Login", 
                     backgroundColor: .customBlue,
                     foregroundColor: .white) {
            
        }

    }
 
}

#Preview {
    LoginView()
}
