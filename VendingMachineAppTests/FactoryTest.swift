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
    var energyDrinkFactory : EnergyDrinkFactory!
    var coffeeFactory : CoffeeFactory!
    var sodaFactory : SodaFactory!
    var milkFactory : MilkFactory!
    
    override func setUp() {
        vendingMachine = VendingMachine()
    }
    
    func testEnergyDrinkFactory(){
        let energyDrinkFactory = EnergyDrinkFactory()
        
        let monster = energyDrinkFactory.createBeverage(with : "Monster")
        let hot6ix = energyDrinkFactory.createBeverage(with: "Hot6ix")

        vendingMachine.append(product: monster)
        vendingMachine.append(product: hot6ix)
    }
    func testSodaFactory(){
        let sodaFactory = SodaFactory()
        
        let sprite = sodaFactory.createBeverage(with: "Sprite")
        let coke = sodaFactory.createBeverage(with: "Coke")
        
        vendingMachine.append(product: sprite)
        vendingMachine.append(product: coke)
    }

    func testMilkFactory(){
        let milkFactory = MilkFactory()
        
        let chocolateMilk = milkFactory.createBeverage(with: "Chocolate")
        let stroberryMilk = milkFactory.createBeverage(with: "Stroberry")
        let bananaMilk = milkFactory.createBeverage(with: "Banana")
        
        vendingMachine.append(product: chocolateMilk)
        vendingMachine.append(product: stroberryMilk)
        vendingMachine.append(product: bananaMilk)
    }
    
    func testCoffeeFactory(){
        let coffeeFactory = CoffeeFactory()
        
        let top = coffeeFactory.createBeverage(with: "TOP")
        let cantata = coffeeFactory.createBeverage(with: "Cantata")
        let georgia = coffeeFactory.createBeverage(with: "Georgia")
        
        vendingMachine.append(product: top)
        vendingMachine.append(product: cantata)
        vendingMachine.append(product: georgia)
    }
}
