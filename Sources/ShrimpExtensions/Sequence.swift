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

    func find<T: Equatable>(by keyPath: KeyPath<Element, T>, is comparisonValue: T) -> Element? {
        find(where: { $0[keyPath: keyPath] == comparisonValue })
    }

    func find(where predicate: (Element) throws -> Bool) rethrows -> Element? {
        try self.first(where: predicate)
    }
}
