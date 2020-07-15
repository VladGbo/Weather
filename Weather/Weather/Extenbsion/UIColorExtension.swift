//
//  UIColorExtension.swift
//  Weather
//
//  Created by Vladislav Horbenko on 13.07.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import UIKit

enum CustomColor: String {
    case darkBlue = "darkBlue"
    case blue = "Blue"
    case white = "White"
    case black = "Black"
}

extension UIColor {

    static func fetch (color: CustomColor) -> UIColor {
        return UIColor(named: color.rawValue)!
    }
}
