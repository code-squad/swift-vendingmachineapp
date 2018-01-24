//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 8..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    var machine: (UserServable&Managable)?
    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var productImageViews: [UIImageView]!
    @IBOutlet var balanceButtons: [UIButton]!
    @IBOutlet var purchaseButtons: [UIButton]!
    let purchasedImageViewRect: CGRect
    let purchasedImageSpacing: CGFloat
    let imageViewMaker: ProductImageViewMaker

    required init?(coder aDecoder: NSCoder) {
        let origin = CGPoint(x: 40, y: 686)
        let size = CGSize(width: 140, height: 100)
        self.purchasedImageViewRect = CGRect(origin: origin, size: size)
        self.purchasedImageSpacing = 50
        self.imageViewMaker = ProductImageViewMaker(self.purchasedImageViewRect)
        super.init(coder: aDecoder)
    }

    // 세그 실행 직전 데이터 전달 위함.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let adminVC = segue.destination as? AdminViewController {
            adminVC.machine = self.machine
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabels()
        updateBalanceLabel()
        // 둥근 테두리 적용
        productImageViews.forEach { $0.layer.cornerRadius = 15 }
        productImageViews.forEach { $0.layer.borderWidth = 5 }
        balanceButtons.forEach { $0.layer.cornerRadius = 10 }
        // 버튼에 이벤트 적용
        balanceButtons.forEach {
            $0.addTarget(self, action: #selector(insertMoney(_:)), for: .touchUpInside)
        }
        purchaseButtons.forEach {
            $0.addTarget(self, action: #selector(purchase(_:)), for: .touchUpInside)
        }
        // 자판기(M)에 변화가 생기면 잔액라벨(V) 업데이트.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateStockLabels),
            name: .didUpdateStock,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateBalanceLabel),
            name: .didUpdateBalance,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(catchNotification(notification:)),
            name: .didUpdateInventory,
            object: nil)
    }

    @objc func purchase(_ sender: UIButton) {
        guard let machine = self.machine,
            let menu: VendingMachine.Menu = Mapper.mappingMenu(with: sender) else { return }
        _ = machine.popProduct(menu)
    }

    @objc func catchNotification(notification: Notification) {
        if let purchased = notification.userInfo,
            let purchasedBeverage = purchased[UserInfoKeys.purchasedBeverage] as? Beverage {
            // 뷰 업데이트
            updatePurchasedImages(purchasedBeverage)
        }
    }

    // 화면 아래 구입한 음료수 이미지 추가
    private func updatePurchasedImages(_ purchasedInfo: Beverage) {
        let source = Mapper.mappingImage(purchasedInfo)
        let imageView = imageViewMaker.produce(source, purchasedImageSpacing)
        self.view.addSubview(imageView)
    }

    // 인벤토리(M)에 변화가 생기면 호출됨. M -> C -> V
    @objc func updateStockLabels() {
        guard let machine = self.machine else { return }
        for (item, stock) in machine.checkTheStock() {
            updateStockLabel(of: item, stock: stock)
        }
    }

    private func updateStockLabel(of item: VendingMachine.Menu, stock: Stock) {
        for label in stockLabels {
            if item == Mapper.mappingMenu(with: label) {
                label.text = Formatter.kor(stock).numberUnit
            }
        }
    }

    // 금액 추가 버튼 클릭 시. V -> C -> M
    @objc func insertMoney(_ sender: UIButton) {
        guard let machine = self.machine,
            let unit: MoneyManager.Unit = Mapper.mappingUnit(with: sender) else { return }
        // 버튼 태그에 따라 특정 금액 삽입.
        machine.insertMoney(unit)
    }

    // 인벤토리(M)에 변화가 생기면 호출됨. M -> C -> V
    @objc func updateBalanceLabel() {
        guard let machine = self.machine else { return }
        // 잔액라벨 업데이트.
        balanceLabel.text = Formatter.kor(machine.showBalance()).moneyUnit
    }

    @IBAction func dismiss(_ segue: UIStoryboardSegue) {
        // Unwind method
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: .didUpdateStock, object: self)
        NotificationCenter.default.removeObserver(self, name: .didUpdateBalance, object: self)
        NotificationCenter.default.removeObserver(self, name: .didUpdateInventory, object: self)
    }

}
