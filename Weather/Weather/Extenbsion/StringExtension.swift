//
//  StringExtension.swift
//  Weather
//
//  Created by Vladislav Horbenko on 02.07.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import UIKit

extension String {
    
    func decorateCity (with color: UIColor) -> NSAttributedString {
        let attribute: [NSAttributedString.Key: Any] = [
            .font : UIFont.systemFont(ofSize: 20.0),
            .foregroundColor : color
        ]
        let attributedString = NSAttributedString(string: self, attributes: attribute)
        return attributedString
        
    }
    
}


