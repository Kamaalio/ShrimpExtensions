//
//  Array.swift
//  
//
//  Created by Kamaal Farah on 13/11/2020.
//

import Foundation

public extension Array where Element: Hashable {
    /// Transforms array to a `Set`
    var toSet: Set<Element> {
        Set(self)
    }

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
    /// Concatenates 2 arrays together.
    /// - Parameter otherArray: The other array to add to the current one.
    /// - Returns: A concatenated array.
    func concat(_ otherArray: [Element]) -> [Element] {
        self + otherArray
    }

    /// Sorts array by given keyPath using the given comparision result.
    /// - Parameters:
    ///   - keyPath: The keyPath of the object to sort by.
    ///   - comparison: The comparison method.
    /// - Returns: A sorted array.
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>, using comparison: ComparisonResult) -> [Element] {
        sorted(by: {
            switch comparison {
            case .orderedAscending:
                return $0[keyPath: keyPath] < $1[keyPath: keyPath]
            case .orderedDescending:
                return $0[keyPath: keyPath] > $1[keyPath: keyPath]
            case .orderedSame:
                return $0[keyPath: keyPath] == $1[keyPath: keyPath]
            }
        })
    }

    /// Gets element at a specific given index. When a negative index has been given the indexing will be reversed.
    /// - Parameter index: A positive or negative index to access elements of this array.
    /// - Returns: Returns the element at the given index. If index is out of range, than this method will return nil.
    func at(_ index: Int) -> Element? {
        guard index < self.underestimatedCount else { return nil }
        if index >= 0 {
            return self[index]
        }
        let reversedIndex = self.count + index
        guard reversedIndex >= 0 else { return nil }
        return self[reversedIndex]
    }

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
