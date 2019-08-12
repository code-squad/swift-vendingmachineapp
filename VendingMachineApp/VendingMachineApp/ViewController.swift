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
    
    // MARK: IBAction
    @IBAction func stockUp(_ sender: UIButton) {
        let product = ProductInput(index: sender.tag)
        vendingMachine.stockUp(of: product.getProduct(), count: 1)
        stockOfProducts[sender.tag].text = setStockCount(tag: sender.tag)
    }
    
    @IBAction func inputMoney(_ sender: UIButton) {
        vendingMachine.pay(of: sender.tag)
        setDepositedMoney()
    }
    
    // MARK: Custom Method
    /// tag를 입력받아 재고의 개수를 String으로 반환하는 메소드
    private func setStockCount(tag: Int) -> String{
        let product = ProductInput(index: tag)
        return "\(vendingMachine.isFullStock()[product.getProduct()]!)개"
    }
    
    /// 잔액을 보여주는 Label에 잔액을 표시하는 메소드
    private func setDepositedMoney() {
        self.depositedMoney.text = "잔액: \(vendingMachine.checkBalance())"
    }
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0...5 {
            let product = ProductInput(index: index)
            vendingMachine.stockUp(of: product.getProduct(), count: 5)
        }
        
        for productImage in productImages {
            productImage.roundedCorner()
        }
        
        for stockOfProduct in stockOfProducts {
            stockOfProduct.text = setStockCount(tag: stockOfProduct.tag)
        }
        
        setDepositedMoney()
    }
}

extension UIImageView {
    func roundedCorner() {
        self.layer.cornerRadius = self.frame.height/4
    }
}
