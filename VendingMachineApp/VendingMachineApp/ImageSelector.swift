//
//  ImageSelector.swift
//  VendingMachineApp
//
//  Created by YOUTH2 on 2018. 4. 2..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import Foundation

protocol ImageSelector {
    var itemImage: String { get }
}

extension ImageSelector {
    var itemImage: String {
        let className = String(describing: type(of: self))
        return "\(className).jpg"
    }
}
