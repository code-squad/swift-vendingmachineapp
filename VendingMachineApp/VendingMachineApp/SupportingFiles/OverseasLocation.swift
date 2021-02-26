//
//  OverseasLocation.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/26.
//

import Foundation

class OverseasLocation: LocationTrackable {
    private let country: String
    
    init(country: String) {
        self.country = country.lowercased()
    }
    
    func isDomestic() -> Bool {
        return false
    }
}
