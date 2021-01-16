//
//  Dictionary.swift
//  
//
//  Created by Kamaal M Farah on 11/01/2021.
//

import Foundation

public extension Dictionary {
    func has(key: Key) -> Bool {
        index(forKey: key) != nil
    }
}
