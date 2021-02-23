//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation

//http://emart.ssg.com/item/itemView.ssg?itemId=0000007095603&siteNo=6001&salestrNo=2034
class Milk: Drink {
    init() {
        super.init(brand: "서울우유", volume: 200, charge: 830, name: "초코우유", manufacturingDate: Date.init()) //제조일자 : now
    }
}
