//
//  UIImageViewExtension.swift
//  Weather
//
//  Created by Vladislav Horbenko on 15.07.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
