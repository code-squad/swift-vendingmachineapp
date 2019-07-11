//
//  LabelledSegment.swift
//  VendingMachineApp
//
//  Created by joon-ho kil on 7/11/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import Foundation

/// Defines a segment of the pie chart.
struct LabelledSegment {
    
    /// The color of the segment.
    var color: UIColor
    
    /// The name of the segment.
    var name: String
    
    /// The value of the segment.
    var value: CGFloat
}
