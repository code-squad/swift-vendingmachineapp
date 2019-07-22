//
//  Drinkable.swift
//  VendingMachine
//
//  Created by hw on 02/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Drinkable{
    func display (printFormat : (_ info: Drinkable) -> Void)
    func validate(with date: Date) -> Bool
    func isLowCalories() -> Bool
    func isHot() -> Bool 
}

