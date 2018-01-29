//
//  AttributedStringExtension.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 29..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    func draw(on sector: Sector) {
        let halfAngle = sector.startAngle + (sector.endAngle-sector.startAngle)/2
        // 절반은 너무 좁아서 반지름길이의 2/3 정도로 잡음.
        let halfRadius = sector.radius*2/3
        // 텍스트 중앙정렬을 위해 글자 실제길이의 절반을 왼쪽으로 옮김(-).
        let centerOfSegment = CGPoint(
            x: sector.origin.x+cos(halfAngle)*halfRadius-self.size().width/2,
            y: sector.origin.y+sin(halfAngle)*halfRadius)
        self.draw(at: centerOfSegment)
    }
}
