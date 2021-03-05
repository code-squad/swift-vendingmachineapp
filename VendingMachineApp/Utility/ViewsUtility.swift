//
//  ViewsUtility.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/05.
//

import UIKit

class ViewsUtility {
    static func getStockCell(names : [String]) -> [OneStockView] {
        var list = [OneStockView]()
        for name in names {
            let imageView = OneStockView(frame : CGRect(x: 0, y: 0, width: 200, height: 200))
            imageView.image = UIImage(named: name)
            list.append(imageView)
        }
        return list
    }
}

