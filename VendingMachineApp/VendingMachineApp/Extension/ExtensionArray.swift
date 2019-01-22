//
//  ExtensionArray.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 22..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

extension Array where Element: UILabel {
    
    func updateStockLabels() {
        
        for stockLabel in self {
            let tag = stockLabel.tag
            guard let beverageType = Mapper.shared.mapping(by: tag) else { return }
            
            let updateStockLabel: (Int) -> Void = { (numberOfProduct: Int) -> Void in
                stockLabel.text = "\(numberOfProduct)개"
            }
            VendingMachine.shared.updateNumber(of: beverageType, update: updateStockLabel)
        }
    }
}
