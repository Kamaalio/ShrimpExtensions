//
//  NSSet.swift
//  
//
//  Created by Kamaal M Farah on 10/01/2021.
//

import Foundation

public extension NSSet {
    func asArray<T>() -> [T]? {
        self.allObjects as? [T]
    }
}
