//
//  Identifier.swift
//  VendingMachine
//
//  Created by 이동건 on 15/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

extension NSObject {
    var identifier: String {
        return String(describing: type(of: self))
    }
}
