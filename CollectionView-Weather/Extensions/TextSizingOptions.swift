//
//  TextSizingOptions.swift
//  StoriesApp
//
//  Created by Vitalii K on 31.03.2020.
//  Copyright © 2020 Vitalii K. All rights reserved.
//

import Foundation

public enum TextSizingOption: Equatable {
    case preferredLineCount(UInt)
    case fillContainer

    public static func == (lhs: TextSizingOption, rhs: TextSizingOption) -> Bool {
        switch (lhs, rhs) {
        case (let .preferredLineCount(lines1), let .preferredLineCount(lines2)):
            return lines1 == lines2
        case (.fillContainer,.fillContainer):
            return true
        default:
            return false
        }
    }
}
