//
//  DateUtils.swift
//  WGUtils
//
//  Created by Bence Pattogato on 18/02/16.
//  Copyright © 2016 Wintergarden. All rights reserved.
//

import UIKit

class DateUtils: NSObject {
    
    // Takes a String and a Format and converts it to an NSDate?
    static func stringToDate(string: String, _ format: String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.dateFromString(string)
        
        return date
    }
    
    //Converts an NSDate into a string with the given format
    static func dateToString(format: String, date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        let string = dateFormatter.stringFromDate(date)
        
        return string
    }
}

// MARK: - Date Extension
extension NSDate {
    
    /// Init NSDate with day, month and year
    class func initDate(day: Int, month: Int, year: Int) -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        
        calendar.timeZone = NSTimeZone.systemTimeZone()
        
        let components = calendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: NSDate())
        components.year = year
        components.month = month
        components.day = day
        
        return calendar.dateFromComponents(components)
    }
    
    /// Returns if the NSDate instance is on a same day parameter date
    func isOnSameDay(date: NSDate) -> Bool {
        let calendar = NSCalendar.currentCalendar()
        
        calendar.timeZone = NSTimeZone.systemTimeZone()
        
        let componentsForFirstDate = calendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: self)
        let componentsForSecondDate = calendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: date)
        
        return componentsForFirstDate.year == componentsForSecondDate.year &&
            componentsForFirstDate.month == componentsForSecondDate.month &&
            componentsForFirstDate.day == componentsForSecondDate.day
    }
    
    /// Returns if the NSDate instance is on a same month parameter date
    func inInSameMonth(date: NSDate) -> Bool {
        let calendar = NSCalendar.currentCalendar()
        
        calendar.timeZone = NSTimeZone.systemTimeZone()
        
        let componentsForFirstDate = calendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: self)
        let componentsForSecondDate = calendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: date)
        
        return componentsForFirstDate.year == componentsForSecondDate.year &&
            componentsForFirstDate.month == componentsForSecondDate.month
    }
    
    /// Returns the beginning of the given date (hour, min, sec)
    func beginningOfDay() -> NSDate {
        let calendar = NSCalendar.currentCalendar()
        
        calendar.timeZone = NSTimeZone.systemTimeZone()
        
        let components = calendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second ], fromDate: self)
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        return calendar.dateFromComponents(components) ?? self
    }
    
    /// Returns the end of the given date (hour, min, sec)
    func endOfDay(isStartOfNextDay isStartOfNextDay: Bool = false) -> NSDate {
        let calendar = NSCalendar.currentCalendar()
        
        calendar.timeZone = NSTimeZone.systemTimeZone()
        
        let components = calendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second ], fromDate: self)
        if isStartOfNextDay {
            components.hour = 24
            components.minute = 0
            components.second = 0
        } else {
            components.hour = 23
            components.minute = 59
            components.second = 59
        }
        
        return calendar.dateFromComponents(components) ?? self
    }
    
    /// Returns the month name as string
    func monthName() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.stringFromDate(self)
    }
    
    /// Returns the years name as string
    func yearString() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.stringFromDate(self)
    }
    
    /// Returns the days of the month's days
    func getMonthsDays() -> [NSDate] {
        let nextCalendar = NSCalendar.currentCalendar()
        let nextComponents = nextCalendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.WeekOfMonth, NSCalendarUnit.Weekday], fromDate: self)
        
        nextComponents.day = 0
        guard let monthBeginningDate = nextCalendar.dateFromComponents(nextComponents) else {
            return [NSDate]()
        }
        
        nextComponents.month = nextComponents.month + 1
        nextComponents.day = 0
        guard let monthEndDate = nextCalendar.dateFromComponents(nextComponents) else {
            return [NSDate]()
        }
        
        let monthDays = NSDate.daysBetweenDates(monthBeginningDate, endDate: monthEndDate)
        
        return monthDays
    }
    
    /// Returns an NSDate array between startDate and endDate
    class func daysBetweenDates(startDate: NSDate!, endDate: NSDate!) -> [NSDate] {
        
        var date = startDate
        
        // date for the loop
        let gregorian:NSCalendar! = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let dateComponents = NSDateComponents()
        dateComponents.year = 1
        
        // Create an array to hold *all* the returned
        // results for the year
        var datesArray = [NSDate]()
        
        // Loop through each date until the ending date is
        // reached
        while date.compare(endDate) != NSComparisonResult.OrderedDescending {
            
            // increment the date by 1 day
            let dateComponents = NSDateComponents()
            dateComponents.day = 1
            date = gregorian.dateByAddingComponents(dateComponents, toDate: date, options: NSCalendarOptions.MatchFirst)
            datesArray.append(date)
        }
        
        datesArray.removeAtIndex(datesArray.count - 1)
        
        return datesArray
    }
    
    /// Returns the next month's date
    func nextMonthDate() -> NSDate {
        let nextCalendar = NSCalendar.currentCalendar()
        let nextComponents = nextCalendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: self)
        nextComponents.month = nextComponents.month + 1
        
        guard let nextMonth = nextCalendar.dateFromComponents(nextComponents) else {
            return NSDate()
        }
        
        return nextMonth
    }
    
    /// Returns the previous month's date
    func previousMonthDate() -> NSDate {
        let prevCalendar = NSCalendar.currentCalendar()
        let prevComponents = prevCalendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: self)
        prevComponents.month = prevComponents.month - 1
        
        guard let prevMonth = prevCalendar.dateFromComponents(prevComponents) else {
            return NSDate()
        }
        
        return prevMonth
    }
    
    /// Returns the month's first day
    func getMonthFirstDay() -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        
        calendar.timeZone = NSTimeZone.systemTimeZone()
        
        let components = calendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: self)
        components.day = 1
        
        return calendar.dateFromComponents(components)
    }
    
    /// Returns a touple(year, month, day) as the date's components
    func components() -> (year: Int, month: Int, day: Int) {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day], fromDate: self)
        return (components.year, components.month, components.day)
    }
    
    /// Returns the number of days in the month
    func numberOfDaysInMonth() -> Int {
        let calendar = NSCalendar.currentCalendar()
        let daysRange = calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: self)
        return daysRange.length
    }
    
}

extension NSDate: Comparable {}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSince1970 == rhs.timeIntervalSince1970
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSince1970 < rhs.timeIntervalSince1970
}