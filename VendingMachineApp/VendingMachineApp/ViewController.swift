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
            case 1 : try! appDelegate.sharedVendingMachine.addBasicDrink(drinkType: .chocoMilk)
            case 2 : try! appDelegate.sharedVendingMachine.addBasicDrink(drinkType: .lowSugarChocoMilk)
            case 3 : try! appDelegate.sharedVendingMachine.addBasicDrink(drinkType: .coke)
            case 4 : try! appDelegate.sharedVendingMachine.addBasicDrink(drinkType: .zeroCalorieCoke)
            case 5 : try! appDelegate.sharedVendingMachine.addBasicDrink(drinkType: .hotTopCoffee)
            case 6 : try! appDelegate.sharedVendingMachine.addBasicDrink(drinkType: .energyDrink)
            default : throw OutputView.errorMessage.wrongDrink
            }
            // 재고를 최신화한다
            try! refreshDrinkCounts()
        }
        catch {
            makeAlert(title: "에러", message: error.localizedDescription, okTitle: "OK")
        }
    }
    
    weak var appDelegate: AppDelegate!
    
    // 생성자
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    /// 잔액추가 버튼액션
    func addBalance(uiButton:UIButton){
        _ = appDelegate.sharedVendingMachine.plusMoney(money: uiButton.tag)
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
        self.balance.text =  "\(appDelegate.sharedVendingMachine.getMoney()) 원"
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
        let storedDrinksDetail = appDelegate.sharedVendingMachine.getAllAvailableDrinks().storedDrinksDetail
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
        super.viewDidLoad()
        self.drink01View.image = UIImage(named: "Drink01.jpg")
        setBorderRadius()
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        do {
            // 자판기 금액 최신화
            refreshBalance()
            // 음료재고 최신화
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

