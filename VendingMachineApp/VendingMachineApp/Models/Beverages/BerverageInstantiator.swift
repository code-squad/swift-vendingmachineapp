//
//  BerverageInstantiator.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/24.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

struct BeverageInstantiator {
    var cantataPrimiumLatte175: Beverage {
        return Cantata(
            milkContentRate: 0.15,
            sugarContentRate: 0.05,
            celsius: 65,
            name: "프리미엄 라떼",
            volume: 175,
            price: 1500
        )
    }
    
    var cantataPrimiumLatte275: Beverage {
        return Cantata(
            milkContentRate: 0.15,
            sugarContentRate: 0.05,
            celsius: 65,
            name: "프리미엄 라떼",
            volume: 275,
            price: 2200
        )
    }
    
    var pepsiDietCola250: Beverage {
        return Pepsi(
            package: Pepsi.Package.can,
            kiloCalorie: 80,
            name: "다이어트 콜라",
            volume: 250,
            price: 1200
        )
    }
    
    var pepsiDietCola591: Beverage {
        return Pepsi(
            package: Pepsi.Package.pet,
            kiloCalorie: 120,
            name: "다이어트 콜라",
            volume: 591,
            price: 2000
        )
    }
    
    var hersheyCookieCream235: Beverage {
        return HersheyChocolateDrink(
            cacaoContentRate: 0.03,
            name: "쿠키앤크림",
            volume: 235,
            price: 1300
        )
    }
    
    var hersheyCookieCream350:
        Beverage {
        return HersheyChocolateDrink(
            cacaoContentRate: 0.03,
            name: "쿠키앤크림",
            volume: 350,
            price: 2000
        )
    }
}
