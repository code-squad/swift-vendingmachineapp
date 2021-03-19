//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class Cantata: Coffee {
    
    private let bean : Beans
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, caffeine : Double?, bean : Beans) {
        self.bean = bean
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing, caffeine: caffeine)
    }
    
    convenience required init() {
        self.init(brand: "롯데칠성음료", volume: 430, charge: 1400, name: "칸타타 콘트라베이스", manufacturing: Date.init(), caffeine : nil, bean: .arabica)
    }
    
    required init?(coder: NSCoder) {
        bean = Beans(rawValue: coder.decodeObject(forKey: "bean") as! String)!
        super.init(coder: coder)
    }
    
    func productBeans() -> Beans {
        return self.bean
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(bean.rawValue,forKey: "bean")
    }
}
