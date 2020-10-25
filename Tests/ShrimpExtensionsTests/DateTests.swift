//
//  DateTests.swift
//  
//
//  Created by Kamaal Farah on 24/10/2020.
//

import XCTest
@testable import ShrimpExtensions

final class DateTests: XCTestCase {
    static var allTests = [
        ("testIsFromSameWeekIsInSameWeek", testIsFromSameWeekIsInSameWeek),
        ("testIsFromSameWeekIsInSameWeekNumberButDiffrentYear", testIsFromSameWeekIsInSameWeekNumberButDiffrentYear),
        ("testIsFromSameWeekIsNotInSameWeek", testIsFromSameWeekIsNotInSameWeek),
        ("testIsFutureWeekIsInLowerWeekNumberButHigherYearNumber",
         testIsFutureWeekIsInLowerWeekNumberButHigherYearNumber),
        ("testIsFutureWeek", testIsFutureWeek),
        ("testIsFutureWeekIsNotFutureWeek", testIsFutureWeekIsInLowerWeekNumber),
        ("testCreateDateFromComponents", testCreateDateFromComponents),
        ("testIsFutureWeekIsInLowerYearNumber", testIsFutureWeekIsInLowerYearNumber)
    ]
}

// - MARK: isFromSameWeek

extension DateTests {
    func testIsFromSameWeekIsInSameWeek() {
        let date1 = DateTestsHelpers.createDateFromComponents(day: 23, month: 10, year: 2020)!
        let date2 = DateTestsHelpers.createDateFromComponents(day: 23, month: 10, year: 2020)!

        XCTAssert(date1.isFromSameWeek(as: date2),
                  "Is in same week and differs 2 days")
    }

    func testIsFromSameWeekIsInSameWeekNumberButDiffrentYear() {
        let date1 = DateTestsHelpers.createDateFromComponents(day: 23, month: 10, year: 2020)!
        let date2 = DateTestsHelpers.createDateFromComponents(day: 28, month: 10, year: 2021)!

        XCTAssertFalse(date1.isFromSameWeek(as: date2),
                       "Has same weeknumber but is in a diffrent year")
    }

    func testIsFromSameWeekIsNotInSameWeek() {
        let date1 = DateTestsHelpers.createDateFromComponents(day: 23, month: 10, year: 2020)!
        let date2 = DateTestsHelpers.createDateFromComponents(day: 26, month: 10, year: 2020)!

        XCTAssertFalse(date1.isFromSameWeek(as: date2),
                       "Is in next week")
    }
}

// - MARK: isFutureWeek

extension DateTests {
    func testIsFutureWeekIsInLowerWeekNumberButHigherYearNumber() {
        let date1 = DateTestsHelpers.createDateFromComponents(day: 23, month: 1, year: 2021)!
        let date2 = DateTestsHelpers.createDateFromComponents(day: 26, month: 10, year: 2020)!

        XCTAssert(date1.isFutureWeek(from: date2),
                  "Is from future year but has a lower week number")
    }

    func testIsFutureWeek() {
        let date1 = DateTestsHelpers.createDateFromComponents(day: 23, month: 2, year: 2021)!
        let date2 = DateTestsHelpers.createDateFromComponents(day: 21, month: 1, year: 2021)!

        XCTAssert(date1.isFutureWeek(from: date2))
    }

    func testIsFutureWeekIsInLowerWeekNumber() {
        let date1 = DateTestsHelpers.createDateFromComponents(day: 23, month: 1, year: 2021)!
        let date2 = DateTestsHelpers.createDateFromComponents(day: 21, month: 2, year: 2021)!

        XCTAssertFalse(date1.isFutureWeek(from: date2))
    }

    func testIsFutureWeekIsInLowerYearNumber() {
        let date1 = DateTestsHelpers.createDateFromComponents(day: 23, month: 1, year: 2020)!
        let date2 = DateTestsHelpers.createDateFromComponents(day: 21, month: 2, year: 2021)!

        XCTAssertFalse(date1.isFutureWeek(from: date2))
    }
}

// - MARK: DateTestsHelpers

extension DateTests {
    func testCreateDateFromComponents() {
        let date = DateTestsHelpers.createDateFromComponents(day: 23, month: 1, year: 2021)!
        XCTAssertEqual(Calendar.current.component(.day, from: date), 23)
        XCTAssertEqual(Calendar.current.component(.month, from: date), 1)
        XCTAssertEqual(Calendar.current.component(.year, from: date), 2021)
    }
}

struct DateTestsHelpers {
    static func createDateFromComponents(day: Int, month: Int, year: Int) -> Date? {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return Calendar.current.date(from: dateComponents)
    }
}
