//
//  StringExtension.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

extension String {

    var convertToIntValue: Int? {
        guard let intValue = Int(self) else {
            return nil
        }
        return intValue
    }

    func convertToInt(from measure: String) -> Int? {
        guard let stringWithoutMeasure = self.extractString(except: measure),
            let resultNumberOfMeasure = Int(stringWithoutMeasure) else {
            return nil
        }
        return resultNumberOfMeasure
    }

    func convertToFloat(from measure: String) -> Float? {
        guard let stringWithoutMeasure = self.extractString(except: measure),
            let resultNumberOfMeasure = Float(stringWithoutMeasure) else {
                return nil
        }
        return resultNumberOfMeasure
    }

    func extractString(except measure: String) -> String? {
        let startMeasureCharacter = self.index(self.endIndex, offsetBy: (measure.count * (-1)))
        let range = startMeasureCharacter...self.index(before: self.endIndex)
        if self[range] != measure {
            return nil
        }
        return String(self[self.startIndex...self.index(before: startMeasureCharacter)])
    }

}
