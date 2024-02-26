//
//  RegistrationViewModel.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 27.02.24.
//

import Foundation

@MainActor
class RegistrationViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var age: String = ""
    
    // MARK: - Published UI Feedback Properties
    @Published var emailErrorMessage: String? = nil
    @Published var passwordErrorMessage: String? = nil
    @Published var ageErrorMessage: String? = nil
    @Published var registrationSuccess: Bool = false
    
    // MARK: - UI Logic Properties
    var isRegisterEnabled: Bool {
        !email.isEmpty && !password.isEmpty && !age.isEmpty
    }
    
    private var userRepository: UserRepository
    
    // MARK: - Initialization
    init(userRepository: UserRepository = MockUserRepository()) {
        self.userRepository = userRepository
    }
    
    // MARK: - Registration Method
    func register() async {
        guard validateEmail(), validateAge(), validatePassword() else { return }
        
        do {
            let ageInt = Int(age) ?? 0
            try await userRepository.register(email: email, password: password, age: ageInt)
            registrationSuccess = true
        } catch UserError.emailAlreadyInUse {
            emailErrorMessage = "This email is already in use."
        } catch {
            emailErrorMessage = "An unexpected error occurred."
        }
    }
    
    // MARK: - Validation Methods
    private func validateEmail() -> Bool {
        guard email.isValidEmail else {
            emailErrorMessage = "Invalid email format."
            return false
        }
        emailErrorMessage = nil
        return true
    }
    
    private func validatePassword() -> Bool {
        guard password.isValidPassword else {
            passwordErrorMessage = "Password must be 6-12 characters long."
            return false
        }
        passwordErrorMessage = nil
        return true
    }
    
    private func validateAge() -> Bool {
        guard age.isValidAgeString else {
            ageErrorMessage = "Age must be between 18 and 99."
            return false
        }
        ageErrorMessage = nil
        return true
    }
}
