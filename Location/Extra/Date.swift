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
}
