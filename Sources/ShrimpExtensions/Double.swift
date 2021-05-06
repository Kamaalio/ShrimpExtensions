//
//  Double.swift
//  
//
//  Created by Kamaal Farah on 28/10/2020.
//

import Foundation
import CoreGraphics

public extension Double {
    var isDecimal: Bool {
        floor(self) == self
    }

    var int: Int {
        Int(self)
    }

    var float: Float {
        Float(self)
    }

    var cgFloat: CGFloat {
        CGFloat(self)
    }

    func percentageOf(_ whole: Double) -> Double {
        let calculation = (self / whole) * 100
        return calculation
    }

    func toFixed(_ precision: Int) -> String {
        String(format: "%.\(precision)f", self)
    }
}
