//
//  LoginViewModel.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var lastErrorMessage = "" {
        didSet { isDisplayingError = true }
    }
    @Published var isDisplayingError = false
    @Published var canNavigateToMainPage: Bool = false
    
    // MARK: - Computed Properties
    var isLoginEnabled: Bool {
        !email.isEmpty && !password.isEmpty
    }
    
    // MARK: - Private Properties
    private var userRepository: UserRepository
    
    // MARK: - Initialization
    init(userRepository: UserRepository = MockUserRepository.shared) {
        self.userRepository = userRepository
    }
    
    // MARK: - Methods
    func login() async {
        guard email.isValidEmail else {
            lastErrorMessage = "Invalid email format."
            return
        }
        
        do {
            try await userRepository.login(email: email.lowercased(), password: password)
            canNavigateToMainPage = true
        } catch let error as UserError {
            handleUserError(error)
        } catch {
            lastErrorMessage = "An unexpected error occurred."
        }
    }
    
    // MARK: - Error Handling
    private func handleUserError(_ error: UserError) {
        switch error {
        case .userNotFound:
            lastErrorMessage = "User not found."
        case .incorrectPassword:
            lastErrorMessage = "Incorrect password."
        default:
            lastErrorMessage = "An unexpected error occurred."
        }
    }
}



