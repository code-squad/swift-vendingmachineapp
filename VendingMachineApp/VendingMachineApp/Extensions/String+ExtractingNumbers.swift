//
//  String+ExtractingNumbers.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/10.
//

import Foundation

extension String {
    func filterNonDigits() -> String {
        return self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
}
