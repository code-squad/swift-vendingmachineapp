//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Yoda Codd on 2018. 9. 13..
//  Copyright © 2018년 Drake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /// 자판기 잔액표기 갱신 함수
    func refreshBalance(){
        self.balance.text =  "\(vendingMachine.getMoney()) 원"
    }
    // 자판기 선언
    var vendingMachine : VendingMachine
    // 생성자
    required init(coder aDecoder: NSCoder) {
        self.vendingMachine = VendingMachine()
        super.init(coder: aDecoder)!
    }
    // 음료1번 이미지뷰
    @IBOutlet weak var drink01View: UIImageView!
    
    @IBOutlet weak var balance: UILabel!
    /// 잔액추가 함수
    func addBalance(uiButton:UIButton){
        _ = vendingMachine.plusMoney(money: uiButton.tag)
        refreshBalance()
    }
    /// 잔액추가 버튼 액션
    @IBAction func addBalance5000(_ sender: UIButton) {
        addBalance(uiButton: sender)
    }
    @IBAction func addBalance10000(_ sender: UIButton) {
        addBalance(uiButton: sender)
    }
    /// 음료 재고들 커렉션
    @IBOutlet var drinkCounts: [UILabel]!
    /// 음료재고 컬렉션 최신화 함수
    func refreshDrinkCounts(){
        
    }
    
    
    
    
    override func viewDidLoad() {
        self.drink01View.layer.masksToBounds = true
        self.drink01View.layer.cornerRadius = 30
        self.drink01View.image = UIImage(named: "Drink01.jpg")
        super.viewDidLoad()
        do {
            _ = try vendingMachine.addDrink(drink: ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "저과당초코우유", manufacturingDateString: "20171009", lowFat: true, lowSugar: true)!)
            _ = try vendingMachine.addDrink(drink: ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "저과당초코우유", manufacturingDateString: "20171009", lowFat: true, lowSugar: true)!)
            _ = try vendingMachine.addDrink(drink: Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDateString: "20171005", usingPET: false, zeroCalorie: true)!)
            _ = try vendingMachine.addDrink(drink: Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDateString: "20171005", usingPET: false, zeroCalorie: true)!)
            _ = try vendingMachine.addDrink(drink: EnergyDrink(barnd: "핫식스", size: 200, price: 1000, name: "핫식스", manufacturingDateString: "20171012", zeroCaffeine: true)!)
            _ = try vendingMachine.addDrink(drink: EnergyDrink(barnd: "핫식스", size: 200, price: 1000, name: "핫식스", manufacturingDateString: "20171012", zeroCaffeine: true)!)
            print(vendingMachine.getAllAvailableDrinks().getAllDrinkDetails())
            
            self.balance.text = "\(vendingMachine.getMoney()) 원"
            
        }
        catch OutputView.errorMessage.failMakingVendingMachine {
            print("자판기 초기화에 실패했습니다")
        }
        catch {
            print(error)
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

