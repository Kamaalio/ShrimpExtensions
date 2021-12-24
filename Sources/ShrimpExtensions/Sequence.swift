//
//  Sequence.swift
//  
//
//  Created by Kamaal Farah on 13/11/2020.
//

import Foundation

public extension Sequence {
    /// Convert to an array.
    func asArray() -> [Iterator.Element] {
        Array(self)
    }

    /// Returns the first element of the sequence that satisfies the given key path and comparison value.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the sequence.
    ///
    /// - Parameters:
    ///   - keyPath: `KeyPath` of equatable type to search for.
    ///   - comparisonValue: The comparison value to to match the condition to search for.
    ///
    /// - Returns: The first element of the sequence that satisfies the given key path
    ///   and comparison value or nil if there is no element that satisfies the condition.
    func find<T: Equatable>(by keyPath: KeyPath<Element, T>, is comparisonValue: T) -> Element? {
        find(where: { $0[keyPath: keyPath] == comparisonValue })
    }

    /// Returns the first element of the sequence that satisfies the given
    /// predicate.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the sequence.
    ///
    /// - Parameter predicate: A closure that takes an element of the sequence as
    ///   its argument and returns a Boolean value indicating whether the
    ///
    /// - Returns: The first element of the sequence that satisfies `predicate`,
    ///   or `nil` if there is no element that satisfies `predicate`.
    func find(where predicate: (Element) throws -> Bool) rethrows -> Element? {
        try self.first(where: predicate)
    }
}
