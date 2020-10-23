//
//  CGSize+extensions.swift
//  
//
//  Created by Kamaal Farah on 23/10/2020.
//

import CoreGraphics

public extension CGSize {
    static func squared(_ number: CGFloat) -> CGSize {
        CGSize(width: number, height: number)
    }
}
