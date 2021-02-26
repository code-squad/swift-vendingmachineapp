//
//  Location.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/26.
//

import Foundation

class DomesticLocation: LocationTrackable {
    private let province: String
    
    init(province: String) {
        self.province = province.lowercased()
    }
    
    func isDomestic() -> Bool {
        return true
    }
    
}
