//
//  UserRepositoryProtocol.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import Foundation

enum UserError: Error {
    case authenticationFailed
    case userNotFound
    case invalidEmailFormat
    case incorrectPassword
}

protocol UserRepository {
    func login(email: String, password: String) async throws -> Void
}

final class MockUserRepository: UserRepository {
    private var registeredUsers = [
        User(id: UUID().uuidString, email: "test@email.com", password: "test1234", age: 21)
    ]
    
    func login(email: String, password: String) async throws -> Void {
        ///    network delay simulation
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        guard email.isValidEmail else {
            throw UserError.invalidEmailFormat
        }
        
        guard let user = registeredUsers.first(where: { $0.email == email }) else {
            throw UserError.userNotFound
        }
        
        guard user.password == password else {
            throw UserError.incorrectPassword
        }
    }
}

