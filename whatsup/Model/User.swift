//
//  User.swift
//  whatsup
//
//  Created by addjn on 16/10/20.
//

import Foundation

struct User: Codable {
    let email: String
    let phone: String
    let name: String
    let imageUrl: String
    let status: String?
    let statusUrl: String?
    let statusTime: String?
}
