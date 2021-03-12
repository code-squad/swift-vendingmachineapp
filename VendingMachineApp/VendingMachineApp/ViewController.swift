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
        vendingMachine.addStock(beverage: factory.addToInventory(beverage: CoffeeFactory.self))
        showCoffeeInventoryQuantity()
    }
    
    @IBAction func addMilkButton(_ sender: Any) {
        vendingMachine.addStock(beverage: factory.addToInventory(beverage: MilkFactory.self))
        showMilkInventoryQuantity()
    }
    
    @IBAction func addSodaButton(_ sender: Any) {
        vendingMachine.addStock(beverage: factory.addToInventory(beverage: SodaFactory.self))
        showSodaInventoryQuantity()
    }
    
    //MARK: 재고 수량 메소드
    func showCoffeeInventoryQuantity() {
        let stock = vendingMachine.showCurrentStock()
        coffeeInventoryQuantity.text = "\(stock[ObjectIdentifier(Cantata.self)]?.count ?? 0)개"
    }
    
    func showMilkInventoryQuantity() {
        let stock = vendingMachine.showCurrentStock()
        milkInventoryQuantity.text = "\(stock[ObjectIdentifier(StrawberryMilk.self)]?.count ?? 0)개"
    }
    
    func showSodaInventoryQuantity() {
        let stock = vendingMachine.showCurrentStock()
        sodaInventoryQuantity.text = "\(stock[ObjectIdentifier(Coke.self)]?.count ?? 0)개"
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
    
    //MARK: 투입 총액 Label
    func showCurrentTotalMoney() {
        currentTotalMoney.text = "잔액: \(vendingMachine.showCurrentInputAmount())원"
    }
    
}

