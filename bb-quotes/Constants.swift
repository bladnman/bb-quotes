//
//  Constants.swift
//  bb-quotes
//
//  Created by Matt Maher on 6/23/23.
//

import Foundation

extension String {
    var replaceSpaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }
}
