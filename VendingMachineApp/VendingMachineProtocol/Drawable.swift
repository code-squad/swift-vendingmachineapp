//
//  Drawable.swift
//  VendingMachineApp
//
//  Created by hw on 14/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

protocol Drawable {
    func drawData(_ format: ([String : Int], Int) -> Void)
    func setColors(_ format: ([String: Int]) -> Void)
}
