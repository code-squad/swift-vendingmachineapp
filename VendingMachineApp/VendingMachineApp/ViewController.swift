//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by delma on 27/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var vendingMachine = VendingMachine()
    
    /*
     할일
     1. 모든 음료 종류 생성
     2. 벤딩머신.애드스탁 에 추가
     3. 음료에 재고추가 버튼 클릭시 벤딩머신.애드스탁
     4. 음료 라벨에 해당 음료 수량 표현
     
     5. 잔액란 벤딩머신.발란스로
     6. 머니에 각 버튼 클릭시 애드발란스
     
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    
    @IBOutlet var backgroundViews: [UIView]!
    @IBOutlet var addStockButton: [UIButton]!
    @IBOutlet var stockCount: [UILabel]!
    @IBOutlet var beverageImages: [UIImageView]!
    
    @IBOutlet var addMoneyButton: [UIButton]!
    @IBOutlet var balanceLabel: UILabel!
    
    func setUI() {
       for img in beverageImages {
            img.layer.cornerRadius = 30.0
        }
        for view in backgroundViews {
            view.layer.cornerRadius = 20.0
        }
    }
    
    @IBAction func addStock(button: UIButton) {
        vendingMachine.addStock(button.tag)
    }
    
    
}

