//
//  Color+Extensions.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import Foundation

extension String {
    // MARK: - static icons
    static var envelope: String {
        "envelope"
    }
    static var lock: String {
        "lock"
    }
    static var calendar: String {
        "calendar"
    }
    static var photo: String {
        "photo"
    }
    
    // MARK: - Validations
    var isValidEmail: Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        return self.count >= 6 && self.count <= 12
    }
    
    var isValidAgeString: Bool {
        guard let age = Int(self), age >= 18, age <= 99 else { return false }
        return true
    }
}



