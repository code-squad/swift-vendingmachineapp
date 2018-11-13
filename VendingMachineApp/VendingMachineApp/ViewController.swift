//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Yoda Codd on 2018. 9. 13..
//  Copyright © 2018년 Drake. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    // 음료1번 이미지뷰
    @IBOutlet weak var drink01View: UIImageView!
    
    @IBOutlet weak var balance: UILabel!
    
    /// 잔액추가 버튼 액션
    @IBAction func addBalance(_ sender: UIButton) {
        addBalance(uiButton: sender)
    }
    
    /// 음료 재고들 커렉션
    @IBOutlet var drinkCounts: [UILabel]!
    
    /// 음료 사진뷰 컬렉션
    @IBOutlet var drinkImages: [UIImageView]!
    
    /// 재고추가 버튼들 컬렉션
    @IBOutlet var addDrinkButtons: [UIButton]!
    
    /// 재고추가버튼액션. 각 재고버튼의 태그값을 기본음료생성 함수에 넣는다
    @IBAction func addBasicDrink(_ sender: UIButton){
        do {
            switch sender.tag {
            case 1 : try! vendingMachine.addBasicDrink(drinkType: .chocoMilk)
            case 2 : try! vendingMachine.addBasicDrink(drinkType: .lowSugarChocoMilk)
            case 3 : try! vendingMachine.addBasicDrink(drinkType: .coke)
            case 4 : try! vendingMachine.addBasicDrink(drinkType: .zeroCalorieCoke)
            case 5 : try! vendingMachine.addBasicDrink(drinkType: .hotTopCoffee)
            case 6 : try! vendingMachine.addBasicDrink(drinkType: .energyDrink)
            default : throw OutputView.errorMessage.wrongDrink
            }
            // 재고를 최신화한다
            try! refreshDrinkCounts()
        }
        catch {
            makeAlert(title: "에러", message: error.localizedDescription, okTitle: "OK")
        }
    }
    
    // 자판기 선언
    var vendingMachine : VendingMachine
    
    // 생성자
    required init(coder aDecoder: NSCoder) {
        self.vendingMachine = VendingMachine()
        super.init(coder: aDecoder)!
    }
    
    /// 잔액추가 버튼액션
    func addBalance(uiButton:UIButton){
        _ = vendingMachine.plusMoney(money: uiButton.tag)
        refreshBalance()
    }
    
    /// 음료재고 컬렉션 초기화 함수
    func initDrinkCounts(){
        for counts in drinkCounts {
            counts.text = "매진됨"
        }
    }
    
    /// 자판기 잔액표기 갱신 함수
    func refreshBalance(){
        self.balance.text =  "\(vendingMachine.getMoney()) 원"
    }
   
    /// 음료정보를 받아서 태그번호를 리턴
    func getDrinkTag(storedDrinkDetail:StoredDrinkDetail)throws->Int{
        switch storedDrinkDetail.drinkType {
        case .chocoMilk : return 1
        case .lowSugarChocoMilk : return 2
        case .coke : return 3
        case .zeroCalorieCoke : return 4
        case .hotTopCoffee : return 5
        case .energyDrink : return 6
        case .none : throw OutputView.errorMessage.wrongDrink
        }
    }
    /// 음료정보와 태그를 받아서 재고표시를 변경
    func changeDrinkCount(storedDrinkDetail:StoredDrinkDetail)throws{
        let drinkTag = try getDrinkTag(storedDrinkDetail: storedDrinkDetail)
        for drinkCount in drinkCounts {
            if drinkCount.tag == drinkTag {
                drinkCount.text = "\(storedDrinkDetail.drinkName) \(storedDrinkDetail.drinkCount) 개"
            }
        }
    }
    
    /// 음료재고 컬렉션 최신화 함수
    func refreshDrinkCounts()throws{
        let storedDrinksDetail = vendingMachine.getAllAvailableDrinks().storedDrinksDetail
        initDrinkCounts()
        for drinkDetil in storedDrinksDetail {
            try changeDrinkCount(storedDrinkDetail: drinkDetil)
        }
    }
    
    /// 음료사진들 테두리를 둥글게
    func setBorderRadius(){
        for view in drinkImages {
            view.layer.masksToBounds = true
            view.layer.cornerRadius = 30
        }
    }
    
    
    /// alert 생성함수
    func makeAlert(title:String,message:String,okTitle:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okTitle, style: UIAlertActionStyle.default,handler : nil )
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        self.drink01View.image = UIImage(named: "Drink01.jpg")
        setBorderRadius()
        super.viewDidLoad()
        do {
            _ = try vendingMachine.addDrink(drink: ChocoMilk(brand: "서울우유", size: 200, price: 1000, name: "저과당초코우유", manufacturingDateString: "20171009", lowFat: true, lowSugar: true)!)
            _ = try vendingMachine.addDrink(drink: ChocoMilk(brand: "서울우유", size: 200, price: 1000, name: "저과당초코우유", manufacturingDateString: "20171009", lowFat: true, lowSugar: true)!)
            _ = try vendingMachine.addDrink(drink: Coke(brand: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDateString: "20171005", usingPET: false, zeroCalorie: true)!)
            _ = try vendingMachine.addDrink(drink: Coke(brand: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDateString: "20171005", usingPET: false, zeroCalorie: true)!)
            _ = try vendingMachine.addDrink(drink: EnergyDrink(brand: "핫식스", size: 200, price: 1000, name: "핫식스", manufacturingDateString: "20171012", zeroCaffeine: true)!)
            _ = try vendingMachine.addDrink(drink: EnergyDrink(brand: "핫식스", size: 200, price: 1000, name: "핫식스", manufacturingDateString: "20171012", zeroCaffeine: true)!)
            
            refreshBalance()
            // 음료재고들 수정
            try refreshDrinkCounts()
        }
        catch {
            // 에러메세지 출력
            makeAlert(title: "에러", message: error.localizedDescription, okTitle: "OK")
        }
        
        
        // viewDidLoad ends
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

