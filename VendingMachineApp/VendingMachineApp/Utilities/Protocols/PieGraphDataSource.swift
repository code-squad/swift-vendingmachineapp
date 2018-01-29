//
//  PieGraphDataSource.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 30..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import Foundation

protocol PieGraphDataSource {
    func initialSegments() -> [Segment]?

    func newSegment() -> Segment?

    func totalValues() -> Int?
}
