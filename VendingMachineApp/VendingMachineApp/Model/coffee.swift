//
//  coffee.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation

//http://emart.ssg.com/item/itemView.ssg?itemId=0000007323904&siteNo=6001&salestrNo=2034&tlidSrchWd=TOP&srchPgNo=1&src_area=elist
class Coffee: Drink {
    
    // 카페인 추가 -> optional 선언으로 decaffein 구현
    // 하위 : 원두 품종
    //  뜨거움 여부
    
    init() {
        super.init(brand: "Maxim", volume: 275, charge: 980, name: "TOP 스위트 아메리카노", manufacturing: Date.init()) //제조일자 : now
    }
}
