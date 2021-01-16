//
//  Character.swift
//  
//
//  Created by Kamaal Farah on 28/10/2020.
//

import Foundation

public extension Character {
    var uppercased: Character {
        string.uppercased().first!
    }

    var isUppercase: Bool {
        uppercased.string == string
    }

    var lowercased: Character {
        string.lowercased().first!
    }


    var isLowercase: Bool {
        lowercased.string == string
    }

    var int: Int? {
        Int(string)
    }

    var string: String {
        String(self)
    }
}
