//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 23..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    var machine: Managable?
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet var stockLabels: [UILabel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabels()
        addStockButtons.forEach {
            $0.addTarget(self, action: #selector(addStock(_:)), for: .touchUpInside)
        }
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateStockLabels),
            name: .didUpdateStock,
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
}
