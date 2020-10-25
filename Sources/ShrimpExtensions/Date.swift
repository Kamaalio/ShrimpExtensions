//
//  Date.swift
//  
//
//  Created by Kamaal Farah on 23/10/2020.
//

import Foundation

public extension Date {
    func datesOfWeek(weekOffset: Int = 0) -> [Date] {
        var dates = [Date]()
        for index in 1...7 {
            if let weekday = Weekday(rawValue: index) {
                let date = dateOfWeek(weekday: weekday, weekOffset: weekOffset)
                dates.append(date)
            }
        }
        return dates
    }

    func isFromSameWeek(as date: Date) -> Bool {
        let selfDate = self
        return selfDate.weekNumber == date.weekNumber && selfDate.yearNumber == date.yearNumber
    }

    func isFutureWeek(from date: Date) -> Bool {
        let selfDate = self
        if selfDate.yearNumber != date.yearNumber {
            return selfDate.yearNumber > date.yearNumber
        }
        return selfDate.weekNumber > date.weekNumber
    }

    func isSameDay(as date: Date) -> Bool {
        let selfDate = self
        return selfDate.dayNumberOfWeek == date.dayNumberOfWeek
            && selfDate.weekNumber ==  date.weekNumber
            && selfDate.yearNumber == date.yearNumber
    }

    var dayNumberOfWeek: Int {
        Calendar.current.component(.day, from: self)
    }

    var weekNumber: Int {
        Calendar.current.component(.weekOfYear, from: self)
    }

    var yearNumber: Int {
        Calendar.current.component(.year, from: self)
    }

    enum Weekday: Int {
        case Sunday = 1
        case Monday = 2
        case Tuesday = 3
        case Wednesday = 4
        case Thursday = 5
        case Friday = 6
        case Saturday = 7
    }
}

internal extension Date {
    func dateOfWeek(weekday targetDayOfWeek: Weekday, weekOffset: Int = 0) -> Date {
        var selfDate = self
        let weekInterval = intervalByDays(days: weekOffset * 7)
        selfDate.addTimeInterval(weekInterval)

        let formattor = DateFormatter()
        formattor.timeZone = TimeZone.current
        formattor.dateFormat = "e"

        if let selfDayOfWeek = Int(formattor.string(from: selfDate)) {
            let interval_days = targetDayOfWeek.rawValue - selfDayOfWeek
            let interval = intervalByDays(days: interval_days)
            selfDate.addTimeInterval(interval)
            return selfDate
        }

        return selfDate
    }

    func intervalByDays(days: Int) -> TimeInterval {
        let secondsPerMinute = 60
        let minutesPerHour = 60
        let hoursPerDay = 24
        return TimeInterval(days * hoursPerDay * minutesPerHour * secondsPerMinute)
    }
}
