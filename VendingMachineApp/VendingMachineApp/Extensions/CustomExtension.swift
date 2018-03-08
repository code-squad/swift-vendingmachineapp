//
//  CustomExtension.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol TypeName: AnyObject {
    static var bringTypeName: String { get }
}

extension TypeName {
    static var bringTypeName: String {
        let type = String(describing: self)
        return type
    }
}
