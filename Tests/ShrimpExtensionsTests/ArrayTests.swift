//
//  ArrayTests.swift
//  
//
//  Created by Kamaal M Farah on 24/12/2021.
//

import Quick
import Nimble

@testable import ShrimpExtensions

final class ArraySpec: QuickSpec {
    override func spec() {

        // - MARK: at

        describe("at") {
            context("Gets elements with given index") {
                let arr = (0..<3).asArray()
                let cases = [
                    (0, 0),
                    (1, 1),
                    (2, 2),
                    (-1, 2),
                    (-2, 1),
                    (-3, 0),
                ]
                for (index, element) in cases {
                    it("gets \(element) with the index of \(index) from \(arr)") {
                        expect(arr.at(index)).to(equal(element))
                    }
                }
            }
            context("Fails to get given element because index is out of range") {
                let arr = (0..<3).asArray()
                let cases = [
                    (-4),
                    (3),
                ]
                for (index) in cases {
                    it("fails to get with the index of \(index)") {
                        expect(arr.at(index)).to(beNil())
                    }
                }
            }
        }

        // - MARK: findIndex

        describe("findIndex") {
            it("finds the index with a key path") {
                let equatableArray: [SomeEquatableObject] = [
                    .init(foo: false, bar: 0),
                    .init(foo: false, bar: 1),
                    .init(foo: true, bar: 2),
                    .init(foo: false, bar: 3)
                ]
                let result = equatableArray.findIndex(by: \.foo, is: true)
                expect(result).to(equal(2))
            }

            it("could not find index with a key path") {
                let equatableArray: [SomeEquatableObject] = [
                    .init(foo: false, bar: 0),
                    .init(foo: false, bar: 1),
                    .init(foo: false, bar: 2),
                    .init(foo: false, bar: 3)
                ]
                let result = equatableArray.findIndex(by: \.bar, is: 4)
                expect(result).to(beNil())
            }
        }

    }

    private struct SomeEquatableObject: Equatable {
        let foo: Bool
        let bar: Int
    }
}
