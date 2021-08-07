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

    // - TODO: REMOVE THIS IN MAJOR VERSION UPDATE
    /// Will be removed in major version update
    mutating func prepend(_ element: Element) {
        self.insert(element, at: 0)
    }

    // - TODO: REMOVE THIS IN MAJOR VERSION UPDATE
    /// Will be removed in major version update
    func prepended(_ element: Element) -> [Element] {
        [element] + self
    }
}

public extension Array {
    /// Transforms `Array` to an `NSSet`
    var asNSSet: NSSet {
        NSSet(array: self)
    }

    /// Adds a new element at the end of the array and returns the result.
    /// - Parameter newElement: The element to append to the array.
    /// - Returns: The result of the array with an appended element
    func appended(_ newElement: Element) -> [Element] {
        self + [newElement]
    }

    mutating func prepend(_ element: Element) {
        self.insert(element, at: 0)
    }

    func prepended(_ element: Element) -> [Element] {
        [element] + self
    }
}
