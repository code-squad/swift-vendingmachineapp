//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    let beverage = Beverage(brandName: "종근당", sizeInMilliliter: 150, itemPrice: 1500, itemName: "두통해소쌍화차")
    let someMilk = Milk(brandName: "서울우유", sizeInMilliliter: 1000, itemPrice: 1500, itemName: "오리지널우유")
    let strawBerryMilk = StrawBerryMilk(brandName: "남양유업", sizeInMilliliter: 500, itemPrice: 3000, itemName: "딸기에몽", farmLocation: .overseasFarm, actualStrawBerry: true)
    let bananaMilk = BananaMilk(brandName: "빙그레", sizeInMilliliter: 240, itemPrice: 1000, itemName: "바나나맛 우유", farmLocation: .domesticFarm, coloring: true)
    let soda = Soda(brandName: "코카콜라", sizeInMilliliter: 1000, itemPrice: 2500, itemName: "코카콜라", isZeroCalories: false)
    let cola = Cola(brandName: "펩시콜라", sizeInMilliliter: 500, itemPrice: 300, itemName: "펩시콜라사계절러브에디션")
    let fanta = Fanta(brandName: "코카콜라", sizeInMilliliter: 500, itemPrice: 1000, itemName: "판타트로피컬후르츠", isZeroCalories: false, isUsingNaturalFruit: true)
    let coffee = Coffee(brandName: "롯데칠성음료", sizeInMilliliter: 250, itemPrice: 3000, itemName: "칸타타", coffeeBean: .아라비카원두)
    let americano = Americano(brandName: "롯데칠성음료", sizeInMilliliter: 500, itemPrice: 900, itemName: "TOP아메리카노", caffeine: 300)
    let caffeLatte = CaffeLatte(brandName: "맥심", sizeInMilliliter: 200, itemPrice: 3432, itemName: "트루라떼")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(beverage, someMilk, strawBerryMilk, bananaMilk, soda, cola, fanta, coffee, americano, caffeLatte, separator: "\n")
        print(beverage.isHot())
        print(someMilk.isLowCalorie())
        print(americano.validate(with: Date()))
    }
}

