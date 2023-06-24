//
//  Quote.swift
//  bb-quotes
//
//  Created by Matt Maher on 6/23/23.
//

import Foundation

struct Quote: Decodable {
    let quote: String
    let character: String
    let production: String
}
