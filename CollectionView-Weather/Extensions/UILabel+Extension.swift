//
//  UILabel+Extension.swift
//  Pokee
//
//  Created by Vitalii K on 18.10.2019.
//  Copyright © 2019 Vitalii K. All rights reserved.
//

import UIKit

extension UILabel {
    convenience public init(text: String? = nil, font: UIFont? = UIFont.systemFont(ofSize: 14), textColor: UIColor = .black, textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = true
        clipsToBounds = true
    }

    func setLineHeight(lineHeight: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.0
        paragraphStyle.lineHeightMultiple = lineHeight
        paragraphStyle.alignment = self.textAlignment

        let attrString = NSMutableAttributedString()
        if (self.attributedText != nil) {
            attrString.append( self.attributedText!)
        } else {
            attrString.append( NSMutableAttributedString(string: self.text!))
            attrString.addAttribute(NSAttributedString.Key.font, value: self.font!, range: NSMakeRange(0, attrString.length))
        }
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        self.attributedText = attrString
    }

    func fitText(maxLines: UInt) {
        guard let text = text else { return }
        numberOfLines = 0
        self.font = UIFont.fontFittingText(text, in: bounds.size, fontDescriptor: font.fontDescriptor, option: .preferredLineCount(maxLines))
    }

    func fitTextToBounds() {
        guard let text = text else { return }
        numberOfLines = 0
        self.font = UIFont.fontFittingText(text, in: bounds.size, fontDescriptor: font.fontDescriptor, option: .fillContainer)
    }
}
