//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation


enum HersheyChocolateDrinks {
    
    static let brand = "허쉬초콜릿드링크"
    
    enum CookieCream {
        
        static let name = "쿠키앤크림"
        static let cacaoContentRate = 0.03
        
        enum Volume235ml {
            
            static let volume = 235
            static let price = 1300
            
        }
        
        enum Volume350ml {
            
            static let volume = 350
            static let price = 2000
            
        }
        
    }
}

extension HersheyChocolateDrinks {
    
    static let builderCookieCream235ml = HersheyChocolateDrinks
        .HersheyBuilder(brand: HersheyChocolateDrinks.brand,
                        name: HersheyChocolateDrinks.CookieCream.name,
                        volume: HersheyChocolateDrinks
                            .CookieCream.Volume235ml.volume,
                        price: HersheyChocolateDrinks
                            .CookieCream.Volume235ml.price,
                        cacaoContentRate: HersheyChocolateDrinks
                            .CookieCream.cacaoContentRate)
    
    static let builderCookieCream350ml = HersheyChocolateDrinks
        .HersheyBuilder(brand: HersheyChocolateDrinks.brand,
                        name: HersheyChocolateDrinks.CookieCream.name,
                        volume: HersheyChocolateDrinks
                            .CookieCream.Volume350ml.volume,
                        price: HersheyChocolateDrinks
                            .CookieCream.Volume350ml.price,
                        cacaoContentRate: HersheyChocolateDrinks
                            .CookieCream.cacaoContentRate)
    
}

enum Cantatas {
    
    static let brand = "칸타타"
    
    enum PriumLatte {
        
        static let name = "프리미엄 라떼"
        static let milkContentRate = 0.15
        static let sugarContentRate = 0.05
        
        enum Volume175ml {
            
            static let volume = 175
            static let price = 1500
            
        }
        
        enum Volume275ml {
            
            static let volume = 275
            static let price = 2200
            
        }
        
    }
    
}

extension Cantatas {
    
    static let builderPrimiumLatte175ml = Cantata.CantataBuilder(brand: Cantatas.brand,
                                                          name: Cantatas.PriumLatte.name,
                                                          volume: Cantatas.PriumLatte
                                                            .Volume175ml.volume,
                                                          price: Cantatas.PriumLatte
                                                            .Volume175ml.price,
                                                          milkContentRate: Cantatas.PriumLatte
                                                            .milkContentRate,
                                                          sugarContentRate: Cantatas.PriumLatte
                                                            .sugarContentRate)
    
    static let builderPrimiumLatte275ml = Cantata.CantataBuilder(brand: Cantatas.brand,
                                                          name: Cantatas.PriumLatte.name,
                                                          volume: Cantatas.PriumLatte
                                                            .Volume275ml.volume,
                                                          price: Cantatas.PriumLatte
                                                            .Volume275ml.price,
                                                          milkContentRate: Cantatas.PriumLatte
                                                            .milkContentRate,
                                                          sugarContentRate: Cantatas.PriumLatte
                                                            .sugarContentRate)
    
}

enum Pepsis {
    
    static let brand = "팹시"
    
    enum DietCola {
        
        static let name = "다이어트 콜라"
        
        enum Volume250ml {
            
            static let volume = 250
            static let price = 1200
            static let package = Package.can
            static let kiloCalorie = 80
        }
        
        enum Volume591ml {
            
            static let volume = 591
            static let price = 2000
            static let package = Package.pet
            static let kiloCalorie = 120
        }
        
    }
    
}

extension Pepsis {
    
    static let builderDietCola250ml = Pepsi.PepsiBuilder(brand: Pepsis.brand,
                                               name: Pepsis.DietCola.name,
                                               volume: Pepsis.DietCola.Volume250ml.volume,
                                               price: Pepsis.DietCola.Volume250ml.price,
                                               kiloCalorie: Pepsis.DietCola
                                                .Volume250ml.kiloCalorie,
                                               package: Pepsis.DietCola.Volume250ml.package)
    
    static let builderDietCola591ml = Pepsi.PepsiBuilder(brand: Pepsis.brand,
                                               name: Pepsis.DietCola.name,
                                               volume: Pepsis.DietCola.Volume591ml.volume,
                                               price: Pepsis.DietCola.Volume591ml.price,
                                               kiloCalorie: Pepsis.DietCola
                                               .Volume591ml.kiloCalorie,
                                               package: Pepsis.DietCola.Volume591ml.package)
    
    
}
