//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Yoda Codd on 2018. 9. 13..
//  Copyright © 2018년 Drake. All rights reserved.
//


/// nottification 이름을 미리 지정
extension Notification.Name {
    // 음료 재고 변화시
    static let drinkCountChanged = Notification.Name("drinkCountChanged")
}

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
            try appDelegate.sharedVendingMachine.addBasicDrink(drinkTypeNumber: sender.tag)
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
        // 음료타입의 기본값이 0 이면 에러처리
        if storedDrinkDetail.drinkType.rawValue == 0 {
            throw OutputView.errorMessage.wrongDrink
        }
        // 0 이 아니라면 음료타입 값 리턴
        return storedDrinkDetail.drinkType.rawValue
    }
    
    /// 음료정보와 태그를 받아서 재고표시를 변경
    func changeDrinkCount(storedDrinkDetail:StoredDrinkDetail)throws{
        // 음료정보에서 음료타입 기본값을 추출
        let drinkTag = try getDrinkTag(storedDrinkDetail: storedDrinkDetail)
        // 기본값 -1 해서 인덱스로 해당 음료에 연결된 label 추출
        let drinkCount = drinkCounts[drinkTag-1]
        // label 값 수정
        drinkCount.text = "\(storedDrinkDetail.drinkName) \(storedDrinkDetail.drinkCount) 개"
    }
    
    /// 음료재고 컬렉션 최신화 함수
    func refreshDrinkCounts(){
        let storedDrinksDetail = appDelegate.sharedVendingMachine.getAllAvailableDrinks().storedDrinksDetail
        initDrinkCounts()
        for drinkDetil in storedDrinksDetail {
            do {
                 try changeDrinkCount(storedDrinkDetail: drinkDetil)
            }
            catch {
                // 에러메세지 출력
                makeAlert(title: "에러", message: error.localizedDescription, okTitle: "OK")
            }
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
    

    
    /// 재고가 추가됬다는 노티가 들어오면 실행됨
    @objc func drinkCountChanged(notification: NSNotification) {
        refreshDrinkCounts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 노티를 보는 옵저버. 노티가 발생하면 해당 함수를 실행한다
        NotificationCenter.default.addObserver(self, selector: #selector(self.drinkCountChanged(notification:)), name: .drinkCountChanged , object: nil)
        // 코드로 사진 변경
        self.drink01View.image = UIImage(named: "Drink01.jpg")
        // 사진 테두리 둥글게 수정
        setBorderRadius()
        
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        // 자판기 금액 최신화
        refreshBalance()
        // 음료 재고 최신화
        refreshDrinkCounts()
        
        // viewDidLoad ends
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

