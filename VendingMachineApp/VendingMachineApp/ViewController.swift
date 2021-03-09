//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/24.
//

import UIKit

class VendingMachineViewController: UIViewController {
    
    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet weak var coffeeInventoryQuantity: UILabel!
    @IBOutlet weak var milkInventoryQuantity: UILabel!
    @IBOutlet weak var sodaInventoryQuantity: UILabel!
    @IBOutlet weak var currentTotalMoney: UILabel!
    private var vendingMachine = VendingMachine()
    private var factory = BeverageFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImageView()
        showCurrentTotalMoney()
    }
    
    //MARK: 음료 이미지 라운드
    func setUpImageView() {
        for image in beverageImages {
            image.layer.cornerRadius = 20
        }
    }
    
    
    //MARK: 재고 추가 버튼
    @IBAction func addCoffeeButton(_ sender: Any) {
        vendingMachine.addStock(beverage: factory.addToInventory(beverage: "Coffee")!)
    }
    
    @IBAction func addMilkButton(_ sender: Any) {
        vendingMachine.addStock(beverage: factory.addToInventory(beverage: "Milk")!)
    }
    
    @IBAction func addSodaButton(_ sender: Any) {
        vendingMachine.addStock(beverage: factory.addToInventory(beverage: "Soda")!)
    }
    
    //MARK: 금액 추가 버튼
    @IBAction func add1000Money(_ sender: Any) {
        vendingMachine.addMoney(additionalAmount: 1000)
        showCurrentTotalMoney()
        
    }
    @IBAction func add5000Money(_ sender: Any) {
        vendingMachine.addMoney(additionalAmount: 5000)
        showCurrentTotalMoney()
    }
    
    //MARK: 총액Label
    func showCurrentTotalMoney() {
        currentTotalMoney.text = "잔액: \(vendingMachine.showCurrentInputAmount())원"
    }
    
}

