//
//  ClosedRange.swift
//  
//
//  Created by Kamaal Farah on 13/11/2020.
//

import Foundation

public extension ClosedRange where Bound: Strideable, Bound.Stride: SignedInteger {
    /// Convert to an array.
    func asArray() -> [Bound] {
        Array(self)
    }
}
