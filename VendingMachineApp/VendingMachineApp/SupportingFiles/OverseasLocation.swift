//
//  OverseasLocation.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/26.
//

import Foundation

class OverseasLocation: NSObject, NSCoding, LocationTrackable {
    private let country: String
    
    init(country: String) {
        self.country = country.lowercased()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(country, forKey: "country")
    }
    
    required init?(coder eDecoder: NSCoder) {
        country = eDecoder.decodeObject(forKey: "country") as! String
    }
    
    func isDomestic() -> Bool {
        return false
    }
}
