//
//  UIButton+Extension.swift
//  Pokee
//
//  Created by Vitalii K on 18.10.2019.
//  Copyright © 2019 Vitalii K. All rights reserved.
//

import UIKit

extension UIButton {

    convenience public init(title: String, titleColor: UIColor, font: UIFont? = .systemFont(ofSize: 14), backgroundColor: UIColor = .clear, target: Any? = nil, action: Selector? = nil) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
    }

    convenience public init(type: UIButton.ButtonType, image: UIImage, tintColor: UIColor? = nil, target: Any? = nil, action: Selector? = nil) {
        self.init(type: type)
        if tintColor == nil {
            setImage(image, for: .normal)
        } else {
            setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
            self.tintColor = tintColor
        }
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
        clipsToBounds = true
    }
}
