//
//  Int.swift
//  
//
//  Created by Kamaal M Farah on 27/02/2021.
//

import Foundation

public extension Int {
    var int64: Int64 {
        Int64(self)
    }

    var nsNumber: NSNumber {
        NSNumber(value: self)
    }
}
