//
//  Energydrink.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Energydrink : Beverage {
    private var caffeineContent : Int
    private var caffine : Bool = false // init에서 두번 호출하기 싫어서 기본적으로 카페인 없는 음료로 초기화
    
    init(caffeineContent : Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature : Int, kcal : Int){
        self.caffeineContent = caffeineContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
    
    convenience init(brand: String, volume: Int, price: Int, name: String, manufactured: Date, kcal : Int){ //카페인 있는 에너지 드링크
        self.init(caffeineContent: 30, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: 5, kcal: kcal)
    }
    
    func isdecaffeine(standard : Int) -> Bool{
        return caffeineContent < standard
    }
}
