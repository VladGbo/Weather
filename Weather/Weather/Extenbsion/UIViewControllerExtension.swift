//
//  UIViewControllerExtension.swift
//  Weather
//
//  Created by Vladislav Horbenko on 02.07.2020.
//  Copyright © 2020 VH. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showInfo(with info: String) {
        let alertController = UIAlertController(title: "INFO", message: info, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okButton)
        present(alertController, animated: true, completion: nil)
    }
}
