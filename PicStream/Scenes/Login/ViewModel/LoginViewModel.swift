//
//  LoginViewModel.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var lastErrorMessage = "" {
        didSet { isDisplayingError = true }
    }
    @Published var isDisplayingError = false
    
    @Published var canNavigateToMainPage: Bool = false
    var isLoginEnabled: Bool {
        !email.isEmpty && !password.isEmpty
    }
    
    private var userRepository: UserRepository
    
    init(userRepository: UserRepository = MockUserRepository()) {
        self.userRepository = userRepository
    }
    
    func login() async {
        
        do {
            try await userRepository.login(email: email, password: password)
            canNavigateToMainPage = true
        } catch let error as UserError {
            handleUserError(error)
        } catch {
            lastErrorMessage = "An unexpected error occurred."
        }
    }
    
    private func handleUserError(_ error: UserError) {
        switch error {
        case .authenticationFailed:
            lastErrorMessage = "Authentication failed. Please try again."
        case .userNotFound:
            lastErrorMessage = "User not found."
        case .invalidEmailFormat:
            lastErrorMessage = "Invalid email format."
        case .incorrectPassword:
            lastErrorMessage = "Incorrect password."
        }
    }
}



