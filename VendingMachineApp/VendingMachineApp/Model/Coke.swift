//
//  Coke.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/02.
//

import Foundation

class Coke: Soda {
    
    enum Package: String {
        case can = "can"
        case pet = "pet"
        case glass = "glass"
    }
    
    private var package: Package
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, temperature: Double, expiredAt: Date, calory: Int, sugarContent: Int, package: Package) {
        self.package = package
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, temperature: temperature, expiredAt: expiredAt, calory: calory, sugarContent: sugarContent)
    }
    
    //MARK: encode 메소드, required init
    override func encode(with coder: NSCoder) {
        coder.encode(self.package.rawValue, forKey: "package")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.package = Package(rawValue: coder.decodeObject(forKey: "package") as! String)!
        super.init(coder: coder)
    }
}
