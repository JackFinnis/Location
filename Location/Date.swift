//
//  Date.swift
//  Ecommunity
//
//  Created by Jack Finnis on 24/11/2021.
//

import Foundation

extension Date {
    func formattedRelative() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        let string = formatter.localizedString(for: self, relativeTo: Date.now)
        if string == "in 0 seconds" {
            return "Just now"
        } else {
            return string
        }
    }
    
    func formattedApple() -> String {
        let calendar = Calendar(identifier: .gregorian)
        
        if calendar.isDateInToday(self) {
            return self.formatted(date: .omitted, time: .shortened)
        } else if calendar.isDateInYesterday(self) {
            return "Yesterday"
        } else {
            let secondsToday = calendar.dateComponents([.second], from: self).second ?? 0
            let oneWeekAgo = Date().addingTimeInterval(-Double(secondsToday)-7*24*3_600)
            
            if self > oneWeekAgo {
                let weekdayIndex: Int = calendar.dateComponents([.weekday], from: self).weekday ?? 0
                return DateFormatter().weekdaySymbols[weekdayIndex-1]
            } else {
                return self.formatted(date: .numeric, time: .omitted)
            }
        }
    }
}
