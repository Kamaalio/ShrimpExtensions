//
//  Int64.swift
//  
//
//  Created by Kamaal M Farah on 27/02/2021.
//

import Foundation

public extension Int64 {
    var int: Int {
        Int(self)
    }

    var nsNumber: NSNumber {
        self as NSNumber
    }
}
