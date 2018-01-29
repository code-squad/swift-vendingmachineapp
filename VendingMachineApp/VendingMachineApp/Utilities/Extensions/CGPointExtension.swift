//
//  CGPointExtension.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 29..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import UIKit

extension CGPoint {
    func distance(from point: CGPoint) -> CGFloat {
        let dx = pow(abs(self.x-point.x), 2)
        let dy = pow(abs(self.y-point.y), 2)
        return sqrt(dx+dy)
    }
}
