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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImageView()
    
    }
    
    //MARK: 음료 이미지 라운드
    func setUpImageView() {
        for image in beverageImages {
            image.layer.cornerRadius = 20
        }
    }
    
    
    //MARK: 재고 추가 버튼
    @IBAction func addCoffeeButton(_ sender: Any) {
        
    }
    
    @IBAction func addMilkButton(_ sender: Any) {
        
    }
    
    @IBAction func addSodaButton(_ sender: Any) {
        
    }
    
    //MARK: 금액 추가 버튼
    @IBAction func add1000Money(_ sender: Any) {
        
    }
    @IBAction func add5000Money(_ sender: Any) {
        
    }
    
}

