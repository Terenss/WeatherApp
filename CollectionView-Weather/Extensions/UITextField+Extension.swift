//
//  UITextField+Extension.swift
//  Pokee
//
//  Created by Vitalii K on 01.02.2020.
//  Copyright © 2020 Vitalii K. All rights reserved.
//

import UIKit

extension UITextField {

    convenience public init(text: String? = nil, placeholder: String? = nil, keyboardType: UIKeyboardType = .default, returnKeyType: UIReturnKeyType = .default, font: UIFont = UIFont.systemFont(ofSize: 16)) {

        self.init()
        self.text = text
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.font = font
    }

    func formattedNumber(number: String) -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "+XX (XXX) XX-XX-XXX"

        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }

    func formattedIPAdress(number: String) -> String {
        let ipAdress = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "XXX.XXX.XXX.XXX"

        var result = ""
        var index = ipAdress.startIndex
        for ch in mask where index < ipAdress.endIndex {
            if ch == "X" {
                result.append(ipAdress[index])
                index = ipAdress.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
