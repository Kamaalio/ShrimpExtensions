//
//  Date.swift
//  
//
//  Created by Kamaal Farah on 23/10/2020.
//

import Foundation

public extension Date {
    func nextDays(till amountOfDays: Int, offset: Int = 0) -> [Date] {
        guard amountOfDays > 0,
              let date = Calendar.current.date(byAdding: .day, value: offset, to: self) else { return [] }
        return (0..<amountOfDays).compactMap {
            Calendar.current.date(byAdding: .day, value: $0, to: date)
        }
    }

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

    func adding(minutes: Int) -> Date {
        Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }

    @available(OSX 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
    func toIsoString() -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions.insert(.withFractionalSeconds)
        return formatter.string(from: self)
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
        Calendar.current.component(.yearForWeekOfYear, from: self)
    }

    var startOfDay : Date {
        let calendar = Calendar.current
        let unitFlags = Set<Calendar.Component>([.year, .month, .day])
        let components = calendar.dateComponents(unitFlags, from: self)
        return calendar.date(from: components)!
   }

    var endOfDay : Date {
        var components = DateComponents()
        components.day = 1
        let date = Calendar.current.date(byAdding: components, to: self.startOfDay)
        return (date?.addingTimeInterval(-1))!
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
