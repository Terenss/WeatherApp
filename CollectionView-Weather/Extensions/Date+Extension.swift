//
//  Date+Extension.swift
//  GoodMe
//
//  Created by Vitalii K on 04.08.2020.
//  Copyright © 2020 Vitalii K. All rights reserved.
//

import UIKit

extension Date {
    func dateFormatWithSuffix(shortMonth: Bool = false) -> String {
        if shortMonth {
            return "EEE, d'\(self.daySuffix())' MMM yyyy"
        } else {
            return "EEE, d'\(self.daySuffix())' MMMM yyyy"
        }
    }

    func daySuffix() -> String {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.day, from: self)
        let dayOfMonth = components.day
        switch dayOfMonth {
        case 1, 21, 31:
            return "st"
        case 2, 22:
            return "nd"
        case 3, 23:
            return "rd"
        default:
            return "th"
        }
    }
}

