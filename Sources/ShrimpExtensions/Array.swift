//
//  Array.swift
//  
//
//  Created by Kamaal Farah on 13/11/2020.
//

import Foundation

public extension Array where Element: Hashable {
    func uniques() -> [Element] {
        var buffer = Array()
        var added = Set<Element>()
        for elem in self {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
}
