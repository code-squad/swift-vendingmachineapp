//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation

//http://emart.ssg.com/item/itemView.ssg?itemId=1000049176186&siteNo=6001&salestrNo=2034&tlidSrchWd=%EC%BD%9C%EB%9D%BC&srchPgNo=1&src_area=elist
class Soda: Drink {
    init() {
        super.init(brand: "CoCa-Cola", volume: 215, charge: 574, name: "코카콜라제로", manufacturingDate: Date.init()) //제조일자 : now
    }
}
