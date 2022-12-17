//
//  RangeTests.swift
//  
//
//  Created by Kamaal M Farah on 17/12/2022.
//

import Quick
import Nimble
import ShrimpExtensions

final class RangeTests: QuickSpec {
    override func spec() {
        describe("asArray") {
            it("transforms range to array") {
                let range = 0..<3
                expect(range.asArray()) == [0, 1, 2]
            }
        }
    }
}
