//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by jang gukjin on 15/07/2019.
//  Copyright © 2019 jang gukjin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Property
    let strawberryMilk = StrawberryMilk()
    let chocolateMilk = ChocolateMilk()
    let coke = Coke()
    let sprite = Sprite()
    let topCoffee = TOPCoffee()
    let cantataCoffee = CantataCoffee()
    private var vendingMachine = VendingMachine()
    
    // MARK: IBOutlet
    @IBOutlet var stockOfProducts: [UILabel]!
    @IBOutlet var productImages: [UIImageView]!
    @IBOutlet var addProducts: [UIButton]!
    @IBOutlet weak var depositedMoney: UILabel!
    
    // MARK: IBAction
    @IBAction func stockUp(_ sender: UIButton) {
        let products = stocks()
        vendingMachine.stockUp(of: products[sender.tag], count: 1)
        stockOfProducts[sender.tag].text = setStockCount(tag: sender.tag)
    }
    
    @IBAction func inputMoney(_ sender: UIButton) {
        vendingMachine.pay(of: sender.tag)
        setDepositedMoney()
    }
    
    // MARK: Custom Method
    /// tag를 입력받아 재고의 개수를 String으로 반환하는 메소드
    private func setStockCount(tag: Int) -> String{
        let products = stocks()
        return "\(vendingMachine.isFullStock()[products[tag]]!)개"
    }
    
    /// 잔액을 보여주는 Label에 잔액을 표시하는 메소드
    private func setDepositedMoney() {
        self.depositedMoney.text = "잔액: \(vendingMachine.checkBalance())"
    }
    
    /// 상품의 순인 배열을 반환
    private func stocks() -> [Product]{
        return [strawberryMilk, chocolateMilk, coke, sprite, topCoffee, cantataCoffee]
    }
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let products = stocks()
        for product in products {
            vendingMachine.stockUp(of: product, count: 5)
        }
        
        for (key, value) in vendingMachine.isFullStock() {
            print("\(key.getName()) (\(value)개)", terminator: " ")
        }
        
        for productImage in productImages {
            productImage.layer.cornerRadius = productImage.frame.height/4
        }
        
        for stockOfProduct in stockOfProducts {
            stockOfProduct.text = setStockCount(tag: stockOfProduct.tag)
        }
        
        setDepositedMoney()
    }
}

