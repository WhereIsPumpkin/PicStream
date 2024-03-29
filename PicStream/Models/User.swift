//
//  User.swift
//  PicStream
//
//  Created by Saba Gogrichiani on 26.02.24.
//

import Foundation

struct User: Equatable {
  let id: UUID
  let email: String
  let password: String
  let age: Int?
}

