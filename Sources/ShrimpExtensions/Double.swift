//
//  Double.swift
//  
//
//  Created by Kamaal Farah on 28/10/2020.
//

import Foundation

public extension Double {
    func percentageOf(_ whole: Double) -> Double {
        let calculation = (self / whole) * 100
        return calculation
    }
}
