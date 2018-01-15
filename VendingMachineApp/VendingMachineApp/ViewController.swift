//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 8..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let machine: VendingMachine
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var productImageViews: [UIImageView]!
    @IBOutlet var balanceButtons: [UIButton]!

    required init?(coder aDecoder: NSCoder) {
        machine = VendingMachine()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 둥근 테두리 적용
        productImageViews.forEach { $0.layer.cornerRadius = 30 }
        balanceButtons.forEach { $0.layer.cornerRadius = 10 }
        // 버튼에 이벤트 적용
        addStockButtons.forEach {
            $0.addTarget(self, action: #selector(addStock(_:)), for: .touchUpInside)
        }
        balanceButtons.forEach {
            $0.addTarget(self, action: #selector(insertMoney(_:)), for: .touchUpInside)
        }
        // 자판기(M)에 변화가 생기면 재고라벨(V), 잔액라벨(V) 업데이트.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateStockLabels),
            name: Notifications.didUpdateInventory.name,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateBalanceLabel),
            name: Notifications.didUpdateBalance.name,
            object: nil)
    }

    // 재고 추가 버튼 클릭 시. V -> C -> M
    @objc func addStock(_ sender: UIButton) {
        // 버튼 태그로 메뉴의 rawValue에 매핑하여 재고 추가.
        machine.supply(Mapper.mappingMenu(with: sender), 1)
    }

    // 인벤토리(M)에 변화가 생기면 호출됨. M -> C -> V
    @objc func updateStockLabels() {
        for (item, stock) in machine.checkTheStock() {
            updateStockLabel(of: item, stock: stock)
        }
    }

    private func updateStockLabel(of item: VendingMachine.Menu, stock: Stock) {
        for label in stockLabels {
            if item == Mapper.mappingMenu(with: label) {
                label.text = "\(stock)개"
            }
        }
    }

    // 금액 추가 버튼 클릭 시. V -> C -> M
    @objc func insertMoney(_ sender: UIButton) {
        // 버튼 태그에 따라 특정 금액 삽입.
        machine.insertMoney(
            MoneyManager<VendingMachine>.Unit(rawValue: Mapper.mappingUnit(with: sender))!)
    }

    // 인벤토리(M)에 변화가 생기면 호출됨. M -> C -> V
    @objc func updateBalanceLabel() {
        // 잔액라벨 업데이트.
        if let balance = machine.showBalance().currency() {
            balanceLabel.text = balance + "원"
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: Notifications.didUpdateInventory.name,
            object: self)
        NotificationCenter.default.removeObserver(
            self,
            name: Notifications.didUpdateBalance.name,
            object: self)
    }

}
