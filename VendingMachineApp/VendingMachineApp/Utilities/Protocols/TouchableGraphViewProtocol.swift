//
//  UserServableProtocol.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 29..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import Foundation

protocol TouchableGraphView {
    var segments: [Segment]? { get set }
    var status: TouchStatus { get set }
    func totalSegmentValues(_ sum: Int?)
}
