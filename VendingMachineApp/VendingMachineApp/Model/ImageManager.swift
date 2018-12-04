//
//  ImageManager.swift
//  VendingMachineApp
//
//  Created by Yoda Codd on 2018. 12. 3..
//  Copyright © 2018년 Drake. All rights reserved.
//

import Foundation

struct ImageManager {
    /// 음료사진 파일명 출력용 함수
    static func makeFileNameFrom(drinkTag : Int) -> String {
        return "Drink0"+String(drinkTag)+".jpg"
    }
}
