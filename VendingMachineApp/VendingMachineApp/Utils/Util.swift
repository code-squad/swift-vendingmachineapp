//
//  Util.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/06.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Util {
    
    static let dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier:"ko_KR")
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }()

}
