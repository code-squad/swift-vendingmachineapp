//
//  UIViewControllerExtension.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 5..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

extension UIViewController {
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}
