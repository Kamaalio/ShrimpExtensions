//
//  Bool.swift
//  
//
//  Created by Kamaal M Farah on 10/01/2021.
//

import Foundation

public extension Bool {
    var int: Int {
        self ? 1 : 0
    }

    var string: String {
        self ? "true" : "false"
    }
}
