//
//  LoginViewModel.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginFailed: Bool = false
    
    private var userRepository: UserRepository
    
    init(userRepository: UserRepository = MockUserRepository()) {
        self.userRepository = userRepository
    }
    
    func login() async {
        do {
            let user = try await userRepository.login(email: email, password: password)
            print("Login successful for user: \(user.email)")
            // Handle successful login, e.g., navigating to another view or updating UI state.
        } catch {
            print("Login failed: \(error)")
            loginFailed = true
            // Handle login failure, e.g., showing an error message.
        }
    }
}

