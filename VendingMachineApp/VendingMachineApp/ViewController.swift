//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    let beverage1 = Beverage(brandName: "종근당", sizeInMilliliter: 150, itemPrice: 9999, itemName: "쌍화차", manufacturingDate: Date())
    let milk1 = Milk(brandName: "서울우유", sizeInMilliliter: 200, itemPrice: 1000, itemName: "날마다딸기우유", milkCategory: .딸기우유)
    let soda1 = Soda(brandName: "펩시", sizeInMilliliter: 1000, itemPrice: 2000, itemName: "스쿼드콜라", sodaCategory: .콜라)
    let coffee1 = Coffee(brandName: "맥심", sizeInMilliliter: 250, itemPrice: 1500, itemName: "TOP이탈리아노", coffeeCategory: .TOP)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(beverage1)
        print(milk1)
        print(soda1)
        print(coffee1)
    }
}

