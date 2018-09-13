//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Yoda Codd on 2018. 9. 13..
//  Copyright © 2018년 Drake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let vendingMachine : VendingMachine
    // 자판기 생성 및 음료추가 함수
    func makeVendingMachine()throws->VendingMachine {
        let vendingMachine = VendingMachine()
        // 음료수 추가
        _ = try vendingMachine.addDrink(drink: ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "저과당초코우유", manufacturingDateString: "20171009", lowFat: true, lowSugar: true)!)
        _ = try vendingMachine.addDrink(drink: ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "저과당초코우유", manufacturingDateString: "20171009", lowFat: true, lowSugar: true)!)
        _ = try vendingMachine.addDrink(drink: Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDateString: "20171005", usingPET: false, zeroCalorie: true)!)
        _ = try vendingMachine.addDrink(drink: Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDateString: "20171005", usingPET: false, zeroCalorie: true)!)
        _ = try vendingMachine.addDrink(drink: Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDateString: "20171009", lowFat: true, lowSugar: false)!)
        _ = try vendingMachine.addDrink(drink: EnergyDrink(barnd: "핫식스", size: 200, price: 1000, name: "핫식스", manufacturingDateString: "20171012", zeroCaffeine: false)!)
        _ = try vendingMachine.addDrink(drink: EnergyDrink(barnd: "핫식스", size: 200, price: 1000, name: "핫식스", manufacturingDateString: "20171012", zeroCaffeine: false)!)
        return vendingMachine
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
        try vendingMachine = makeVendingMachine()
        }
        catch 
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

