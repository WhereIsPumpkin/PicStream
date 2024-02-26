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
}

protocol UserRepository {
    func login(email: String, password: String) async throws -> User
}

final class MockUserRepository: UserRepository {
    private var registeredUsers = [
        User(id: UUID().uuidString, email: "test@email.com", password: "test1234", age: 21)
    ]
    
    func login(email: String, password: String) async throws -> User {
        ///    network delay simulation
        try await Task.sleep(nanoseconds: 2_000_000_000)
        
        guard let user = registeredUsers.first(where: { $0.email == email && $0.password == password }) else {
            throw UserError.authenticationFailed
        }
        
        return user
    }
}

