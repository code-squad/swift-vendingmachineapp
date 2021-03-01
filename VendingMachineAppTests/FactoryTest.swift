//
//  FactoryTest.swift
//  VendingMachineAppTests
//
//  Created by 박혜원 on 2021/02/27.
//

import XCTest
@testable import VendingMachineApp

class FactoryTest: XCTestCase {
    
    var vendingMachine : VendingMachine!
    
    override func setUp() {
        vendingMachine = VendingMachine()
    }
    
    func testEnergyDrinkFactory(){
        let energyDrinkFactory = EnergyDrinkFactory()
        
        let monster = EnergyDrinkFactory.createBeverage(with : "Monster")
        let hot6ix = EnergyDrinkFactory.createBeverage(with: "Hot6ix")

        vendingMachine.append(product: monster)
        vendingMachine.append(product: hot6ix)
    }
    func testSodaFactory(){
        let sodaFactory = SodaFactory()
        
        let sprite = SodaFactory.createBeverage(with: "Sprite")
        let coke = SodaFactory.createBeverage(with: "Coke")
        
        vendingMachine.append(product: sprite)
        vendingMachine.append(product: coke)
    }

    func testMilkFactory(){
        let milkFactory = MilkFactory()
        
        let chocolateMilk = MilkFactory.createBeverage(with: "Chocolate")
        let stroberryMilk = MilkFactory.createBeverage(with: "Stroberry")
        let bananaMilk = MilkFactory.createBeverage(with: "Banana")
        
        vendingMachine.append(product: chocolateMilk)
        vendingMachine.append(product: stroberryMilk)
        vendingMachine.append(product: bananaMilk)
    }
    
    func testCoffeeFactory(){
        let coffeeFactory = CoffeeFactory()
        
        let top = CoffeeFactory.createBeverage(with: "TOP")
        let cantata = CoffeeFactory.createBeverage(with: "Cantata")
        let georgia = CoffeeFactory.createBeverage(with: "Georgia")
        
        vendingMachine.append(product: top)
        vendingMachine.append(product: cantata)
        vendingMachine.append(product: georgia)
    }
}
