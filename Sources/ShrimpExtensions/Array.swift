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
        self.forEach {
            if !added.contains($0) {
                buffer.append($0)
                added.insert($0)
            }
        }
        return buffer
    }

    mutating func prepend(_ element: Element) {
        self.insert(element, at: 0)
    }

    func prepended(_ element: Element) -> [Element] {
        [element] + self
    }
}
