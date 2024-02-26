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
    @Published var lastErrorMessage = "" {
        didSet { isDisplayingError = true }
    }
    @Published var isDisplayingError = false
    
    @Published var canNavigateToMainPage: Bool = false
    
    private var userRepository: UserRepository
    
    init(userRepository: UserRepository = MockUserRepository()) {
        self.userRepository = userRepository
    }
    
    func login() async {
        guard validateCredentials() else { return }
        
        do {
            try await userRepository.login(email: email, password: password)
            canNavigateToMainPage = true
        } catch let error as UserError {
            handleUserError(error)
        } catch {
            lastErrorMessage = "An unexpected error occurred."
        }
    }
    
    private func validateCredentials() -> Bool {
        guard !email.isEmpty, email.isValidEmail, !password.isEmpty, password.count >= 6, password.count <= 12 else {
            lastErrorMessage = "Email must be valid and password must be between 6 to 12 characters."
            return false
        }
        return true
    }
    
    private func handleUserError(_ error: UserError) {
        switch error {
        case .authenticationFailed:
            lastErrorMessage = "Authentication failed. Please try again."
        case .userNotFound:
            lastErrorMessage = "User not found. Please check your email."
        case .invalidEmailFormat:
            lastErrorMessage = "Invalid email format. Please enter a valid email address."
        case .incorrectPassword:
            lastErrorMessage = "Incorrect password. Please try again."
        }
    }
}



