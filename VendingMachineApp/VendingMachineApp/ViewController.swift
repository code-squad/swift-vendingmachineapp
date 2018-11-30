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
    static let afterAddDrink = Notification.Name("afterAddDrink")
    static let balanceChanged = Notification.Name("balanceChanged")
    static let afterOrderDrink = Notification.Name("afterOrderDrink")
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
    @IBOutlet var drinkCountLabels: [UILabel]!
    
    /// 음료 사진뷰 컬렉션
    @IBOutlet var drinkImageLabels: [UIImageView]!
    
    /// 재고추가 버튼들 컬렉션
    @IBOutlet var addDrinkButtons: [UIButton]!
    
    /// 재고추가버튼액션. 각 재고버튼의 태그값을 기본음료생성 함수에 넣는다
    @IBAction func addBasicDrink(_ sender: UIButton){        
        do {
            try vendingMachine.addBasicDrink(drinkTypeNumber: sender.tag)
        }
        catch {
            makeAlert(title: "에러", message: error.localizedDescription, okTitle: "OK")
        }
    }
    
    /// 음료구매 버튼들
    @IBOutlet var buyDrinkButtons: [UIButton]!
    /// 음료구매버튼 액션
    @IBAction func buyDrink(_ sender: UIButton) {
        do {
            _ = try vendingMachine.buyDrink(drinkTag: sender.tag-20)
        }
        catch let error as OutputView.errorMessage {
            makeAlert(title: "에러", message: error.description, okTitle: "OK")
        }
        catch {
            makeAlert(title: "에러", message: error.localizedDescription, okTitle: "OK")
        }
    }
    
    
    
    // 자판기 객체를 받기위한 변수화
    var vendingMachine : VendingMachine!
    

    /// 잔액추가 버튼액션
    func addBalance(uiButton:UIButton){
        _ = vendingMachine.plusMoney(money: uiButton.tag)
        refreshBalance()
    }
    
    /// 음료재고 컬렉션 초기화 함수
    func initDrinkCounts(){
        for counts in drinkCountLabels {
            counts.text = "매진됨"
        }
    }
    
    /// 자판기 잔액표기 갱신 함수
    func refreshBalance(){
        self.balance.text =  "\(vendingMachine.getMoney()) 원"
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
        // 음료에 연결된 label 추출
        if let drinkCount : UILabel = self.view.viewWithTag(drinkTag) as? UILabel {
            // label 값 수정
            drinkCount.text = "\(storedDrinkDetail.drinkName) \(storedDrinkDetail.drinkCount) 개"
        } else {
            // 초기화 실패시 메세지 출력
            makeAlert(title: "에러", message: "재고 초기화 실패 : "+storedDrinkDetail.drinkName, okTitle: "OK")
        }
    }
    
    
    /// 음료재고 컬렉션 최신화 함수
    func refreshDrinkCounts(){        
        // 재고표시 초기화를 진행
        initDrinkCounts()
        let storedDrinksDetail = vendingMachine.getAllAvailableDrinks().storedDrinksDetail
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
        for view in drinkImageLabels {
            view.layer.masksToBounds = true
            view.layer.cornerRadius = 15
            view.layer.borderWidth = 5
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
    @objc func afterAddDrink(notification: NSNotification) {
        refreshDrinkCounts()
    }
    /// 잔액변동 노티가 들어오면 실행됨
    @objc func balanceChanged(notification: NSNotification) {
        refreshBalance()
    }
    /// 음료구매 노티가 들어오면 실행됨
    @objc func afterOrderDrink(notification: NSNotification) {
        refreshDrinkCounts()
        addNewOrderedDrinkPic()
    }
    
    
    // 주문된 음료 재고 변수
    var orderedDrinkCount = 0
    
    /// 음료태그를 받아서 해당 음료의 사진을 주문음료리스트에 추가
    fileprivate func addOrderedDrinkPic(drinkTag:Int){
        // 음료에 맞는 사진 연결
        let fileName = fileNameFrom(drinkTag: drinkTag)
        let drinkImage = UIImage.init(named:fileName )!
        // 음료 개수에 맞는 위치 설정
        let cardImage : UIImageView = UIImageView(image:drinkImage)
        cardImage.frame = CGRect(x: 40*orderedDrinkCount, y: 575, width: 140, height: 100)
        // 음료사진 추가
        self.view.addSubview(cardImage)
        // 음료 카운트 추가
        orderedDrinkCount += 1
    }
    
    // 음료사진 파일명 용 함수
    func fileNameFrom(drinkTag:Int)->String{
        return "Drink0"+String(drinkTag)+".jpg"
    }
    
    /// 주문된음료 초기 최신화 함수
    func refreshOrderedDrink(){
        // 주문된 음료의 사진을 뷰로 생성
        for drinkTag in vendingMachine.allOderedDrinksTag() {
            addOrderedDrinkPic(drinkTag:drinkTag)
        }
    }
    
    /// 주문된 음료 추가시
    func addNewOrderedDrinkPic(){
        guard let lastDrinkTag = vendingMachine.allOderedDrinksTag().last else {
            return ()
        }
        addOrderedDrinkPic(drinkTag: lastDrinkTag)
    }
    
    /// viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 자판기 의존성 주입
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.vendingMachine = appDelegate.sharedVendingMachine
        
        // 음료재고를 초기화 한다
        initDrinkCounts()
        
        // 노티를 보는 옵저버. 노티가 발생하면 해당 함수를 실행한다
        // 음료 재고 변동 옵저버
        NotificationCenter.default.addObserver(self, selector: #selector(self.afterAddDrink(notification:)), name: .afterAddDrink , object: nil)
        // 금액변동 옵저버
        NotificationCenter.default.addObserver(self, selector: #selector(self.balanceChanged(notification:)), name: .balanceChanged , object: nil)
        // 금액변동 옵저버
        NotificationCenter.default.addObserver(self, selector: #selector(self.afterOrderDrink(notification:)), name: .afterOrderDrink , object: nil)
        
        
        // 사진 테두리 둥글게 수정
        setBorderRadius()
        
        // 자판기 금액 최신화
        refreshBalance()
        // 음료 재고 최신화
        refreshDrinkCounts()
        
        // 주문된음료 사진 최신화
        refreshOrderedDrink()
        
        // viewDidLoad ends
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

