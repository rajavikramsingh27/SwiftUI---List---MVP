//
//  Book.swift
//  List Dynamic
//
//  Created by GranzaX on 13/03/22.
//

import Foundation

struct Book: Codable, Identifiable {
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: String
}
