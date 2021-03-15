//
//  Cola.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class Cola: Soda {
    enum Package: String {
        case can = "can"
        case pet = "pet"
        case glass = "glass"
    }
    private var packageAttribute: Package
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date, expirationAt: Date, temperature: Double, glycemicIndex: Int, packageAttribute: Package) {
        self.packageAttribute = packageAttribute
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt, expirationAt: expirationAt, temperature: temperature, glycemicIndex: glycemicIndex)
    }
    convenience init() {
        self.init(brand: "CocaCola", capacity: 500, price: 1000, name: "cola", manufacturedAt: Date.input("20210302"), expirationAt: Date.input("20210310"), temperature: 5, glycemicIndex: 39, packageAttribute: Package.can)
    }
    
    required init?(coder: NSCoder) {
        packageAttribute = Package(rawValue: coder.decodeObject(forKey: "packageAttribute") as! String)! 
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(packageAttribute.rawValue, forKey: "packageAttribute")
        super.encode(with: coder)
    }
    
    func isPet() -> Bool {
        return self.packageAttribute == Package.pet
    }
}
