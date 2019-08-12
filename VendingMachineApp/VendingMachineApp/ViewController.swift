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
    private var vendingMachine = VendingMachine()
    
    // MARK: IBOutlet
    @IBOutlet var stockOfProducts: [UILabel]!
    @IBOutlet var productImages: [UIImageView]!
    @IBOutlet var addProducts: [UIButton]!
    @IBOutlet weak var depositedMoney: UILabel!
    @IBOutlet var addMoney: [UIButton]!
    
    // MARK: IBAction
    @IBAction func stockUp(_ sender: UIButton) {
        let index = addProducts.firstIndex(of: sender) ?? addProducts.startIndex
        let product = ProductInput(index: index)
        vendingMachine.stockUp(of: product.getProduct(), count: 1)
        stockOfProducts[index].text = setStockCount(index: index)
    }
    
    @IBAction func inputMoney(_ sender: UIButton) {
        let index = addMoney.firstIndex(of: sender) ?? addMoney.startIndex
        let money = index == 0 ? 1000 : 5000
        vendingMachine.pay(of: money)
        setDepositedMoney()
    }
    
    // MARK: Custom Method
    /// IBOutlet Collection의 Index를 입력받아 재고의 개수를 String으로 반환하는 메소드
    private func setStockCount(index: Int) -> String{
        let product = ProductInput(index: index)
        let value = vendingMachine.isFullStock()[product.getProduct()]!
        return vendingMachine.printCount(value: value)
    }
    
    /// 잔액을 보여주는 Label에 잔액을 표시하는 메소드
    private func setDepositedMoney() {
        self.depositedMoney.text = vendingMachine.checkBalance()
    }
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0..<stockOfProducts.count {
            let product = ProductInput(index: index)
            vendingMachine.stockUp(of: product.getProduct(), count: 5)
        }
        
        for productImage in productImages {
            productImage.roundedCorner()
        }
        
        for stockOfProduct in stockOfProducts {
            stockOfProduct.text = setStockCount(index: stockOfProducts.firstIndex(of: stockOfProduct) ?? stockOfProducts.startIndex)
        }
        
        setDepositedMoney()
    }
}

extension UIImageView {
    func roundedCorner() {
        self.layer.cornerRadius = self.frame.height/4
    }
}
