//
//  Sequence.swift
//  
//
//  Created by Kamaal Farah on 13/11/2020.
//

import Foundation

public extension Sequence {
    /// Convert to an array.
    func asArray() -> [Iterator.Element] {
        Array(self)
    }
}
