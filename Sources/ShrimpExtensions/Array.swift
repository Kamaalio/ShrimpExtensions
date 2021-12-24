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
    /// Returns the first index of the sequence that satisfies the given key path and comparison value.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the sequence.
    ///
    /// - Parameters:
    ///   - keyPath: `KeyPath` of equatable type to search for.
    ///   - comparisonValue: The comparison value to to match the condition to search for.
    ///
    /// - Returns: The first index of the sequence that satisfies the given key path
    ///   and comparison value or nil if there is no element that satisfies the condition.
    func findIndex<T: Equatable>(by keyPath: KeyPath<Element, T>, is comparisonValue: T) -> Int? {
        self.findIndex(where: { $0[keyPath: keyPath] == comparisonValue })
    }

    /// Returns the first index of the sequence that satisfies the given
    /// predicate.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the sequence.
    ///
    /// - Parameter predicate: A closure that takes an element of the sequence as
    ///   its argument and returns a Boolean value indicating whether the
    ///
    /// - Returns: The first index of the sequence that satisfies `predicate`,
    ///   or `nil` if there is no element that satisfies `predicate`.
    func findIndex(where predicate: (Element) throws -> Bool) rethrows -> Int? {
        try self.firstIndex(where: predicate)
    }

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
