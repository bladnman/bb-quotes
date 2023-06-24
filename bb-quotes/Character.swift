//
//  Character.swift
//  bb-quotes
//
//  Created by Matt Maher on 6/23/23.
//

import Foundation

struct Character: Decodable {
    var name: String
    var birthday: String
    var occupations: [String]
    var images: [URL]
    var aliases: [String]
    var portrayedBy: String
}
