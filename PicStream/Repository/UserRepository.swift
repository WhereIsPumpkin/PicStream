//
//  UserRepositoryProtocol.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import Foundation

enum UserError: Error {
    /// auth errors
    case userNotFound
    case incorrectPassword
    case emailAlreadyInUse
}

protocol UserRepository {
    func login(email: String, password: String) async throws -> Void
    func register(email: String, password: String, age: Int) async throws -> Void
}

final class MockUserRepository: UserRepository {
    private var registeredUsers = [
        User(id: UUID(), email: "test@email.com", password: "test1234", age: 21)
    ]
    
    func login(email: String, password: String) async throws -> Void {
        ///   network delay simulation
        try await Task.sleep(nanoseconds: 500_000_000)
        
        guard let user = registeredUsers.first(where: { $0.email == email }) else {
            throw UserError.userNotFound
        }
        
        guard user.password == password else {
            throw UserError.incorrectPassword
        }
    }
    
    func register(email: String, password: String, age: Int) async throws -> Void {
        try await Task.sleep(nanoseconds: 500_000_000)
        
        if registeredUsers.contains(where: { $0.email == email }) {
            throw UserError.emailAlreadyInUse
        }
        
        let user = User(id: UUID(), email: email, password: password, age: age)
        registeredUsers.append(user)
    }

}


