//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 8..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var machine: (Managable&UserServable)?
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet var productImageViews: [UIImageView]!
    @IBOutlet var balanceButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabels()
        updateBalanceLabel()
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
            name: .didUpdateInventory,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateBalanceLabel),
            name: .didUpdateBalance,
            object: nil)
    }

    // 재고 추가 버튼 클릭 시. V -> C -> M
    @objc func addStock(_ sender: UIButton) {
        guard let machine = self.machine,
            let menu: VendingMachine.Menu = Mapper.mappingMenu(with: sender) else { return }
        // 버튼 태그로 메뉴의 rawValue에 매핑하여 재고 추가.
        machine.supply(menu, 1)
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

    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: .didUpdateInventory,
            object: self)
        NotificationCenter.default.removeObserver(
            self,
            name: .didUpdateBalance,
            object: self)
    }

}
