//
//  BeverageData.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 22..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

let stringData = [
    "brands": [
        VendingMachine.MenuType.strawberryMilk: "서울우유",
        VendingMachine.MenuType.bananaMilk: "서울우유",
        VendingMachine.MenuType.chocoMilk: "서울우유",
        VendingMachine.MenuType.coke: "펩시",
        VendingMachine.MenuType.cider: "롯데칠성음료",
        VendingMachine.MenuType.fanta: "코카콜라컴퍼니",
        VendingMachine.MenuType.top: "맥심",
        VendingMachine.MenuType.cantata: "롯데칠성음료",
        VendingMachine.MenuType.georgia: "코카콜라"
    ],
    "productName": [
        VendingMachine.MenuType.strawberryMilk: "날마다딸기우유",
        VendingMachine.MenuType.bananaMilk: "날마다바나나우유",
        VendingMachine.MenuType.chocoMilk: "날마다초코우유",
        VendingMachine.MenuType.coke: "다이어트콜라",
        VendingMachine.MenuType.cider: "사이다",
        VendingMachine.MenuType.fanta: "환타오렌지",
        VendingMachine.MenuType.top: "티오피",
        VendingMachine.MenuType.cantata: "칸타타",
        VendingMachine.MenuType.georgia: "조지아"
    ],
    "packingMaterial": [
        VendingMachine.MenuType.strawberryMilk: "종이",
        VendingMachine.MenuType.bananaMilk: "종이",
        VendingMachine.MenuType.chocoMilk: "종이"
    ]
]

let intData = [
    "volume": [
        VendingMachine.MenuType.strawberryMilk: 200,
        VendingMachine.MenuType.bananaMilk: 200,
        VendingMachine.MenuType.chocoMilk: 200,
        VendingMachine.MenuType.coke: 350,
        VendingMachine.MenuType.cider: 350,
        VendingMachine.MenuType.fanta: 350,
        VendingMachine.MenuType.top: 200,
        VendingMachine.MenuType.cantata: 200,
        VendingMachine.MenuType.georgia: 200
    ],
    "price": [
        VendingMachine.MenuType.strawberryMilk: 1000,
        VendingMachine.MenuType.bananaMilk: 1000,
        VendingMachine.MenuType.chocoMilk: 1000,
        VendingMachine.MenuType.coke: 2000,
        VendingMachine.MenuType.cider: 2000,
        VendingMachine.MenuType.fanta: 2000,
        VendingMachine.MenuType.top: 2200,
        VendingMachine.MenuType.cantata: 2200,
        VendingMachine.MenuType.georgia: 2200
    ],
    "expirationDate": [
        VendingMachine.MenuType.strawberryMilk: 60*60*24*7,
        VendingMachine.MenuType.bananaMilk: 60*60*24*7,
        VendingMachine.MenuType.chocoMilk: 60*60*24*7,
        VendingMachine.MenuType.coke: 60*60*24*30*6,
        VendingMachine.MenuType.cider: 60*60*24*30*6,
        VendingMachine.MenuType.fanta: 60*60*24*30*7,
        VendingMachine.MenuType.top: 60*60*24*14,
        VendingMachine.MenuType.cantata: 60*60*24*14,
        VendingMachine.MenuType.georgia: 60*60*24*2
    ],
    "calories": [
        VendingMachine.MenuType.strawberryMilk: 210,
        VendingMachine.MenuType.bananaMilk: 220,
        VendingMachine.MenuType.chocoMilk: 240,
        VendingMachine.MenuType.coke: 250,
        VendingMachine.MenuType.cider: 250,
        VendingMachine.MenuType.fanta: 300,
        VendingMachine.MenuType.top: 240,
        VendingMachine.MenuType.cantata: 250,
        VendingMachine.MenuType.georgia: 100
    ],
    "manufacturerCode": [
        VendingMachine.MenuType.strawberryMilk: 1001,
        VendingMachine.MenuType.bananaMilk: 1001,
        VendingMachine.MenuType.chocoMilk: 1001
    ],
    "carbonContent": [
        VendingMachine.MenuType.coke: 50,
        VendingMachine.MenuType.cider: 60,
        VendingMachine.MenuType.fanta: 40
    ],
    "caffeineLevels": [
        VendingMachine.MenuType.top: 20,
        VendingMachine.MenuType.cantata: 10,
        VendingMachine.MenuType.georgia: 25
    ]
]
