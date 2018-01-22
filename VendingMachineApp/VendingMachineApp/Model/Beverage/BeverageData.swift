//
//  BeverageData.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 22..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

let stringData = [
    Beverage.CodingKeys.brand: [
        VendingMachine.Menu.strawberryMilk: "서울우유",
        VendingMachine.Menu.bananaMilk: "서울우유",
        VendingMachine.Menu.chocoMilk: "서울우유",
        VendingMachine.Menu.coke: "펩시",
        VendingMachine.Menu.cider: "롯데칠성음료",
        VendingMachine.Menu.fanta: "코카콜라컴퍼니",
        VendingMachine.Menu.top: "맥심",
        VendingMachine.Menu.cantata: "롯데칠성음료",
        VendingMachine.Menu.georgia: "코카콜라"
    ],
    Beverage.CodingKeys.productName: [
        VendingMachine.Menu.strawberryMilk: "날마다딸기우유",
        VendingMachine.Menu.bananaMilk: "날마다바나나우유",
        VendingMachine.Menu.chocoMilk: "날마다초코우유",
        VendingMachine.Menu.coke: "다이어트콜라",
        VendingMachine.Menu.cider: "사이다",
        VendingMachine.Menu.fanta: "환타오렌지",
        VendingMachine.Menu.top: "티오피",
        VendingMachine.Menu.cantata: "칸타타",
        VendingMachine.Menu.georgia: "조지아"
    ],
    Beverage.CodingKeys.packingMaterial: [
        VendingMachine.Menu.strawberryMilk: "종이",
        VendingMachine.Menu.bananaMilk: "종이",
        VendingMachine.Menu.chocoMilk: "종이"
    ]
]

let intData = [
    Beverage.CodingKeys.volume: [
        VendingMachine.Menu.strawberryMilk: 200,
        VendingMachine.Menu.bananaMilk: 200,
        VendingMachine.Menu.chocoMilk: 200,
        VendingMachine.Menu.coke: 350,
        VendingMachine.Menu.cider: 350,
        VendingMachine.Menu.fanta: 350,
        VendingMachine.Menu.top: 200,
        VendingMachine.Menu.cantata: 200,
        VendingMachine.Menu.georgia: 200
    ],
    Beverage.CodingKeys.price: [
        VendingMachine.Menu.strawberryMilk: 1000,
        VendingMachine.Menu.bananaMilk: 1000,
        VendingMachine.Menu.chocoMilk: 1000,
        VendingMachine.Menu.coke: 2000,
        VendingMachine.Menu.cider: 2000,
        VendingMachine.Menu.fanta: 2000,
        VendingMachine.Menu.top: 2200,
        VendingMachine.Menu.cantata: 2200,
        VendingMachine.Menu.georgia: 2200
    ],
    Beverage.CodingKeys.expirationDate: [
        VendingMachine.Menu.strawberryMilk: 60*60*24*7,
        VendingMachine.Menu.bananaMilk: 60*60*24*7,
        VendingMachine.Menu.chocoMilk: 60*60*24*7,
        VendingMachine.Menu.coke: 60*60*24*30*6,
        VendingMachine.Menu.cider: 60*60*24*30*6,
        VendingMachine.Menu.fanta: 60*60*24*30*7,
        VendingMachine.Menu.top: 60*60*24*14,
        VendingMachine.Menu.cantata: 60*60*24*14,
        VendingMachine.Menu.georgia: 60*60*24*2
    ],
    Beverage.CodingKeys.calories: [
        VendingMachine.Menu.strawberryMilk: 210,
        VendingMachine.Menu.bananaMilk: 220,
        VendingMachine.Menu.chocoMilk: 240,
        VendingMachine.Menu.coke: 250,
        VendingMachine.Menu.cider: 250,
        VendingMachine.Menu.fanta: 300,
        VendingMachine.Menu.top: 240,
        VendingMachine.Menu.cantata: 250,
        VendingMachine.Menu.georgia: 100
    ],
    Beverage.CodingKeys.manufacturerCode: [
        VendingMachine.Menu.strawberryMilk: 1001,
        VendingMachine.Menu.bananaMilk: 1001,
        VendingMachine.Menu.chocoMilk: 1001
    ],
    Beverage.CodingKeys.carbonContent: [
        VendingMachine.Menu.coke: 50,
        VendingMachine.Menu.cider: 60,
        VendingMachine.Menu.fanta: 40
    ],
    Beverage.CodingKeys.caffeineLevels: [
        VendingMachine.Menu.top: 20,
        VendingMachine.Menu.cantata: 10,
        VendingMachine.Menu.georgia: 25
    ]
]
