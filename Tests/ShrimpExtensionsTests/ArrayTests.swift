//
//  ArrayTests.swift
//  
//
//  Created by Kamaal M Farah on 24/12/2021.
//

import XCTest
@testable import ShrimpExtensions

final class ArrayTests: XCTestCase { }

// - MARK: findIndex

extension ArrayTests {
    func testFindIndexWithKeyPath() {
        let equatableArray: [SomeEquatableObject] = [
            .init(foo: false, bar: 0),
            .init(foo: false, bar: 1),
            .init(foo: true, bar: 2),
            .init(foo: false, bar: 3)
        ]
        let result = equatableArray.findIndex(by: \.foo, is: true)
        XCTAssertEqual(result, 2)
    }

    private struct SomeEquatableObject: Equatable {
        let foo: Bool
        let bar: Int
    }
}
