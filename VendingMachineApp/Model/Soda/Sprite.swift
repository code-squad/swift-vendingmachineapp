//
//  Sprite.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class Sprite : Soda {
    
    let lowSuger : Bool
    
    init(create: String, expire: String, lowSuger : Bool){
        self.lowSuger = lowSuger
        super.init(brand: "칠성사이다", capacity: 350, price: 3500, name: "코카콜라", create: create, expire: expire)
    }
}
