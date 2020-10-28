//
//  Character.swift
//  
//
//  Created by Kamaal Farah on 28/10/2020.
//

import Foundation

public extension Character {
    var isUppercase: Bool {
        String(self).uppercased() == String(self)
    }
}
