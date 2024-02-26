//
//  Color+Extensions.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import Foundation

extension String {
    static var envelope: String {
        "envelope"
    }
    static var lock: String {
        "lock"
    }
    
    /// validation
    var isValidEmail: Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
}



