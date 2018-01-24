//
//  PieGraphModel.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2018. 1. 24..
//  Copyright © 2018년 Napster. All rights reserved.
//

import UIKit

protocol PieGraphDataSource: AdminAbleGetData {
    var colors: [Beverage: UIColor] { get }
}

extension PieGraphDataSource {
    var colors: [Beverage: UIColor] {
        return [Coke(): UIColor(red: 1.0, green: 31.0/255.0, blue: 73.0/255.0, alpha: 1.0),
                LightBananaMilk(): UIColor(red: 1.0, green: 222.0/255.0, blue: 0.0, alpha: 1.0),
                Sprite(): UIColor(red: 0.0, green: 222.0/255.0, blue: 1.0, alpha: 1.0),
                CeylonTea(): UIColor(red: 1.0, green: 138.0/255.0, blue: 0.0, alpha: 1.0),
                StarBucksCoffee(): UIColor(red: 138.0/255.0, green: 1.0, blue: 222.0/255.0, alpha: 1.0)]
    }
}
