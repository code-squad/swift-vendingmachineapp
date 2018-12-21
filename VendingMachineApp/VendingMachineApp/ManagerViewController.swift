//
//  ManagerViewController.swift
//  VendingMachineApp
//
//  Created by Yoda Codd on 2018. 12. 1..
//  Copyright © 2018년 Drake. All rights reserved.
//

import UIKit
import os

class ManagerViewController: UIViewController, PieInfo {
    /// 원그래프 선언
    @IBOutlet weak var pieGraphView: PieGraphView!
    
    /// 첫 화면으로 돌아감
    @IBAction func dismiss(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }

    @IBOutlet weak var balance: UILabel!
    
    /// 잔액추가 버튼 액션
    @IBAction func addBalance(_ sender: UIButton) {
        do {
            // 태그를 금액으로 변환한다
            let money = try plusMoneyActionTag(tag: sender.tag)
            // 변환 성공하면 추가
            self.vendingMachine.plusMoney(money: money)
        }
            // 실패시
        catch let error as OutputView.errorMessage {
            os_log("%@", error.description)
        }
        catch {
            os_log("%@", error.localizedDescription)
        }
    }
    
    /// 음료 재고들 커렉션
    @IBOutlet var drinkCountLabels: [UILabel]!
    
    /// 음료 사진뷰 컬렉션
    @IBOutlet var drinkImageLabels: [UIImageView]!
    
    /// 재고추가버튼액션. 각 재고버튼의 태그값을 기본음료생성 함수에 넣는다
    @IBAction func addBasicDrink(_ sender: UIButton) {
        do {
            try vendingMachine.addBasicDrink(drinkTypeNumber: sender.tag)
        }
        catch {
            os_log( "%@", error.localizedDescription)
        }
    }
    
    /// 음료구매 버튼들
    @IBOutlet var buyDrinkButtons: [UIButton]!
    /// 음료구매버튼 액션
    @IBAction func buyDrink(_ sender: UIButton) {
        // 음료태그를 받아서 음료를 주문한다
        do {
            // 받은 태그를 음료타입으로 변환
            let drinkType = try drinkTypeFrom(drinkTag: drinkOrderActionTag(tag: sender.tag))
            // 음료태그로 음료주문
             try vendingMachine.buyDrink(drinkType: drinkType)
        }
        catch let error as OutputView.errorMessage {
            os_log("%@", error.description)
        }
        catch {
            os_log("%@", error.localizedDescription)
        }
    }
    // 이벤트 시작점
    var startPoint : CGPoint!
    
    /// 파이그래프에 드래그 제스처의 포인트들을 보낸다
    @IBAction func pieGraphPanGesture(_ sender: UIPanGestureRecognizer) {
        // 이벤트 동안의 움직임이 저장됨
        let translation = sender.translation(in: self.pieGraphView)
        
        guard let view = sender.view as? PieGraphView else { return }
        // 이벤트를 넘겨서 상태를 받게한다
        view.checkGesture(event: sender)
        
//         이벤트가 시작되면 위치를 저장한다
        if sender.state == UIGestureRecognizerState.began {
            startPoint = sender.location(in: view)
        }
        
        // 드래그 중의 위치
        let movedPoint = CGPoint(x: startPoint.x + translation.x, y: startPoint.y + translation.y)
        // 드래그 중인 위치를 넘긴다
        view.setPanGesturingPoint(point: movedPoint)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        refreshPieChart()
    }
    
    /// viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 노티 옵저버 생성
        makeNotificationObserver()
        
        // 자판기객체 생성
        self.vendingMachine = VendingMachine.shared()
        
        // 사진 테두리 둥글게 수정
        setBorderRadius()
        
        // 자판기 금액 최신화
        refreshBalance()
        // 음료 재고 최신화
        refreshDrinkCounts()
        
        // 주문된음료 사진 최신화
        refreshOrderedDrink()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// 노티 생성 함수
    func makeNotificationObserver(){
        // 노티를 보는 옵저버. 노티가 발생하면 해당 함수를 실행한다
        // 음료 재고 추가 옵저버
        NotificationCenter.default.addObserver(self, selector: #selector(self.afterAddDrink(notification:)), name: .afterAddDrink , object: nil)
        // 음료 재고 제거 옵저버
        NotificationCenter.default.addObserver(self, selector: #selector(self.afterPopDrink(notification:)), name: .afterPopDrink , object: nil)
        // 금액변동 옵저버
        NotificationCenter.default.addObserver(self, selector: #selector(self.balanceChanged(notification:)), name: .balanceChanged , object: nil)
        // 금액변동 옵저버
        NotificationCenter.default.addObserver(self, selector: #selector(self.afterAddOrderedDrinkList(notification:)), name: .afterAddOrderedDrinkList , object: nil)
    }
    
    
    // 자판기객체 선언
    var vendingMachine : VendingMachine!
    
    /// 음료재고,사진,주문버튼 의 태그 규칙
    func drinkPicTag(tag: Int) -> Int {
        return tag - 10
    }
    func drinkOrderActionTag(tag: Int) -> Int {
        return tag - 20
    }
    func plusMoneyActionTag(tag: Int) throws -> Int{
        // 잔액추가버튼튼 31번 부터 시작됨
        // 5000, 10000 존재
        switch tag {
        case 31 : return 5000
        case 32 : return 10000
        default : throw OutputView.errorMessage.wrongMoney
        }
    }
    
    /// 음료태그를 음료타입으로 변환해서 리턴
    func drinkTypeFrom(drinkTag: Int) throws -> DrinkType {
        let drinkType : DrinkType? = DrinkType(rawValue: drinkTag)
        if drinkType == nil || drinkType == DrinkType.none {
            throw OutputView.errorMessage.wrongDrink
        }
        return drinkType!
    }
    
    /// 자판기 잔액표기 갱신 함수
    func refreshBalance() {
        self.balance.text =  "\(vendingMachine.getMoney()) 원"
    }
    
    /// 음료정보를 받아서 태그번호를 리턴
    func getDrinkTag(storedDrinkDetail: StoredDrinkDetail) throws -> Int {
        // 음료타입의 기본값이 0 이면 에러처리
        if storedDrinkDetail.drinkType.rawValue == 0 {
            throw OutputView.errorMessage.wrongDrink
        }
        // 0 이 아니라면 음료타입 값 리턴
        return storedDrinkDetail.drinkType.rawValue
    }
    
    /// 음료정보와 태그를 받아서 재고표시를 변경
    func changeDrinkCount(storedDrinkDetail: StoredDrinkDetail) throws {
        // 음료정보에서 음료타입 기본값을 추출
        let drinkTag = try getDrinkTag(storedDrinkDetail: storedDrinkDetail)
        // 음료에 연결된 label 추출
        if let drinkCount : UILabel = self.view.viewWithTag(drinkTag) as? UILabel {
            // label 값 수정
            drinkCount.text = "\(storedDrinkDetail.drinkName) \(storedDrinkDetail.drinkCount) 개"
        } else {
            os_log("%@", "재고 초기화 실패 : "+storedDrinkDetail.drinkName)
        }
    }
    
    
    /// 음료재고 컬렉션 최신화 함수
    func refreshDrinkCounts() {
        let storedDrinksDetail = vendingMachine.getAllAvailableDrinks().storedDrinksDetail
        for drinkDetil in storedDrinksDetail {
            do {
                try changeDrinkCount(storedDrinkDetail: drinkDetil)
            }
            catch {
                os_log("%@", error.localizedDescription)
            }
        }
    }
    
    /// 음료사진들 테두리를 둥글게
    func setBorderRadius() {
        for view in drinkImageLabels {
            view.layer.masksToBounds = true
            view.layer.cornerRadius = 15
            view.layer.borderWidth = 5
        }
    }
    
    /// 재고가 추가됬다는 노티가 들어오면 실행됨
    @objc func afterAddDrink(notification: NSNotification) {
        refreshDrinkCounts()
    }
    /// 재고가 추가됬다는 노티가 들어오면 실행됨
    @objc func afterPopDrink(notification: NSNotification) {
        refreshDrinkCounts()
    }
    /// 잔액변동 노티가 들어오면 실행됨
    @objc func balanceChanged(notification: NSNotification) {
        refreshBalance()
    }
    /// 주문한음료 추가완료 노티가 들어오면 실행됨
    @objc func afterAddOrderedDrinkList(notification: NSNotification) {
        addNewOrderedDrinkPic()
    }
    
    
    // 주문된 음료 재고 변수
    var orderedDrinkCount = 0
    
    /// 음료태그를 받아서 해당 음료의 사진을 주문음료리스트에 추가
    private func addOrderedDrinkPic(drinkTag: Int) {
        // 음료에 맞는 사진 연결
        let drinkImage = makeUIImage(drinkTag: drinkTag)
        // 음료 개수에 맞는 위치 설정
        let cardImage : UIImageView = UIImageView(image: drinkImage)
        cardImage.frame = CGRect(x: 40*orderedDrinkCount, y: 575, width: 140, height: 100)
        // 음료사진 추가
        self.view.addSubview(cardImage)
        // 음료 카운트 추가
        orderedDrinkCount += 1
    }
    
    /// 파일명을 받아서 UIImage 를 리턴. 없으면 공백리턴
    private func makeUIImage(drinkTag: Int) ->UIImage {
        let drinkImage = ImageManager.makeFileNameFrom(drinkTag: drinkTag)
        guard let result = UIImage.init(named: drinkImage) else {
            return UIImage.init()
        }
        return result
    }
    
    /// 주문된음료 초기 최신화 함수
    func refreshOrderedDrink() {
        // 주문된 음료의 사진을 뷰로 생성
        for drinkTag in vendingMachine.allOderedDrinksTag() {
            addOrderedDrinkPic(drinkTag:drinkTag)
        }
    }
    
    /// 주문된 음료 추가시
    func addNewOrderedDrinkPic() {
        guard let lastDrinkTag = vendingMachine.allOderedDrinksTag().last else {
            return ()
        }
        addOrderedDrinkPic(drinkTag: lastDrinkTag)
    }
    
    
    /// 음료 주문시 파이차트 갱신
    func refreshPieChart(){
        pieGraphView.setOrderedDrinkList(pieInfo: self)
    }
    
    /// 파이정보 프로토콜 준수
    func getPieInfo() -> DrinkPieInfo {
        return vendingMachine.getPieInfo()
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        super.motionBegan(motion, with: event)
        pieGraphView.resetRaduis()
    }
}
