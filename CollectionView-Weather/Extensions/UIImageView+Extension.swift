//
//  UIImageView+Extension.swift
//  Pokee
//
//  Created by Vitalii K on 18.10.2019.
//  Copyright © 2019 Vitalii K. All rights reserved.
//

import UIKit

extension UIImageView {

    convenience public init(image: UIImage? = nil, cornerRadius: CGFloat = 0, imageContentMode: UIView.ContentMode? = nil) {
        self.init(image: image)
        self.layer.cornerRadius = cornerRadius
        if let mode = imageContentMode {
            contentMode = mode
        }
        clipsToBounds = true
        layer.masksToBounds = true
    }
}
