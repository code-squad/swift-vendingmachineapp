//
//  Cola.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class Cola: Soda {
    
    private let sugarContent : Double
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, package : Materials, sugarContent : Double) {
        self.sugarContent = sugarContent
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing, package: package)
    }
    
    convenience required init() {
        self.init(brand: "CoCa-Cola", volume: 215, charge: 574, name: "코카콜라제로", manufacturing: Date.init(), package : Materials.steel, sugarContent : 0)
    }
    
    required init?(coder: NSCoder) {
        sugarContent = coder.decodeDouble(forKey: "sugarContent")
        super.init(coder: coder)
    }
    
    func isUnsweetened() -> Bool {
        return sugarContent < 2
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(sugarContent,forKey: "sugarContent")
    }
}
