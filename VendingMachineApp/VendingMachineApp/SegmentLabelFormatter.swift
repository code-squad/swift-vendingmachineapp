//
//  SegmentLabelFormatter.swift
//  VendingMachineApp
//
//  Created by joon-ho kil on 7/11/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import Foundation

struct SegmentLabelFormatter {
    private let _getLabel: (LabelledSegment) -> String
    init(_ getLabel: @escaping (LabelledSegment) -> String) {
        self._getLabel = getLabel
    }
    func getLabel(for segment: LabelledSegment) -> String {
        return _getLabel(segment)
    }
}

extension SegmentLabelFormatter {
    /// Display the segment's name along with its value in parentheses.
    static let nameWithValue = SegmentLabelFormatter { segment in
        let formattedValue = NumberFormatter.toOneDecimalPlace
            .string(from: segment.value as NSNumber) ?? "\(segment.value)"
        return "\(segment.name) (\(formattedValue))"
    }
    
    /// Only display the segment's name.
    static let nameOnly = SegmentLabelFormatter { $0.name }
}
