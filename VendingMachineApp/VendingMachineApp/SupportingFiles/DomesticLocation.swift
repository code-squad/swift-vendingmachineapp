//
//  Location.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/26.
//

import Foundation

class DomesticLocation: NSObject, NSCoding, LocationTrackable {
    private let province: String
    
    init(province: String) {
        self.province = province.lowercased()
    }
    
    convenience override init() {
        self.init(province: "미표기")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(province, forKey: "province")
    }
    
    required init?(coder eDecoder: NSCoder) {
        province = eDecoder.decodeObject(forKey: "province") as! String
    }
    
    func isDomestic() -> Bool {
        return true
    }
}
