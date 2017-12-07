//
//  Menu.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 27..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Menu {
    private(set) var drinkList: [Drink]

    init() {
        let strawBerryMilk = StrawBerryMilk(brand: "서울우유",
                                            weight: "200ml",
                                            price: "1000원",
                                            name: "날마다딸기우유",
                                            dateOfManufacture: "20171009",
                                            calorie: "300kcal",
                                            ingredients: ["strawBerrySyrup"],
                                            ratioOfStrawBerrySyrup: "3.2%")
        let bananaMilk = BananaMilk(brand: "서울우유",
                                    weight: "200ml",
                                    price: "1000원",
                                    name: "날마다바나나우유",
                                    dateOfManufacture: "20171012",
                                    calorie: "350kcal",
                                    ingredients: ["bananaSyrup"],
                                    ratioOfBananaSyrup: "2.5%")
        let chocolateMilk = ChocolateMilk(brand: "서울우유",
                                          weight: "200ml",
                                          price: "1000원",
                                          name: "날마다초코우유",
                                          dateOfManufacture: "20171012",
                                          calorie: "350kcal",
                                          ingredients: ["chocolateSyrup"],
                                          ratioOfCocoaPowder: "2.5%")
        let coke = Coke(calorie: "200kcal",
                        brand: "팹시",
                        weight: "350ml",
                        price: "2000원",
                        name: "다이어트콜라",
                        dateOfManufacture: "20171005",
                        amountOfSugar: "50g")
        let cider = Cider(calorie: "200kcal",
                          brand: "칠성",
                          weight: "350ml",
                          price: "2500원",
                          name: "칠성사이다",
                          dateOfManufacture: "20171010",
                          amountOfSugar: "100g")

        let fanta = Fanta(calorie: "300kcal",
                          brand: "환타",
                          weight: "300ml",
                          price: "2000원",
                          name: "환타",
                          dateOfManufacture: "20171011",
                          amountOfSugar: "100g",
                          taste: .orange)

        let topCoffee = Top(calorie: "150kcal",
                            brand: "맥심",
                            weight: "400ml",
                            price: "3000원",
                            name: "TOP아메리카노",
                            dateOfManufacture: "20171010",
                            isHot: true,
                            amountOfCaffeine: "30mg",
                            nameOfCoffeeBeans: "Colombia",
                            taste: .chocolateMocha)
        let georgiaCoffee = Georgia(calorie: "200kcal",
                                    brand: "맥심",
                                    weight: "450ml",
                                    price: "3500원",
                                    name: "조지아커피",
                                    dateOfManufacture: "20171111",
                                    isHot: true,
                                    amountOfCaffeine: "30mg",
                                    nameOfCoffeeBeans: "Colombia",
                                    size: .max)
        let cantataCoffee = Cantata(calorie: "200kcal",
                                    brand: "맥심",
                                    weight: "450ml",
                                    price: "3500원",
                                    name: "칸타타커피",
                                    dateOfManufacture: "20171110",
                                    isHot: true,
                                    amountOfCaffeine: "30mg",
                                    nameOfCoffeeBeans: "Colombia",
                                    taste: .americano)

        drinkList = [ strawBerryMilk!,
                      bananaMilk!,
                      chocolateMilk!,
                      coke!,
                      cider!,
                      fanta!,
                      cantataCoffee!,
                      topCoffee!,
                      georgiaCoffee!]
    }

}
