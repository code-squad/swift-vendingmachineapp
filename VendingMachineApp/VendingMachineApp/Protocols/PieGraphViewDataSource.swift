//
//  PieGraphViewDataSource.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 7. 16..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

protocol PieGraphViewDataSource {
    var countList: [String:Int] { get }
}
