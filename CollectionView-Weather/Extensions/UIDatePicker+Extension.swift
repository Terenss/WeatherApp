//
//  UIDatePicker+Extension.swift
//  GoodMe
//
//  Created by Vitalii K on 05.08.2020.
//  Copyright © 2020 Vitalii K. All rights reserved.
//

import UIKit

extension UIDatePicker {

    var textColor: UIColor? {
        set {
            setValue(newValue, forKeyPath: "textColor")
        }
        get {
            return value(forKeyPath: "textColor") as? UIColor
        }
    }

    var highlightsToday : Bool? {
        set {
            setValue(newValue, forKeyPath: "highlightsToday")
        }
        get {
            return value(forKey: "highlightsToday") as? Bool
        }
    }
}
