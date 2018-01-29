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
    @IBOutlet weak var pieGraphView: PieGraphView! {
        didSet {
            // 초기 세그먼트 세팅.
            pieGraphView.segments = machine?.purchasedCounts().map({ (menu, count) -> Segment in
                generateSegment(menu, count)
            })
            // 초기 터치상태 세팅.
            pieGraphView.status = UITouchPhase.stationary
            // 쉐이크 제스처 시, pieGraphView가 first responder가 됨
            pieGraphView.becomeFirstResponder()
        }
    }

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
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(addSegment(_:)),
            name: .didUpdateRecord,
            object: nil)
    }

    // 세그먼트 생성 함수.
    private func generateSegment(_ menu: VendingMachine.Menu, _ purchasedCount: Int) -> Segment {
        // 세그먼트 추가될 시 총 판매개수도 함께 세팅.
        pieGraphView.totalSegmentValues(machine?.totalPurchasedCount)
        return Segment(name: menu.productName, value: purchasedCount, color: UIColor.random)
    }

    // 추가된 구매이력으로 세그먼트 추가.
    @objc func addSegment(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        if let addedRecord = userInfo[UserInfoKeys.addedRecord] as? HistoryInfo {
            let newSegment = generateSegment(addedRecord.purchasedMenu, addedRecord.count)
            pieGraphView.segments?.append(newSegment)
        }
    }

    // 현재 뷰컨트롤러가 보일 시, 파이그래프 뷰 업데이트.
    override func viewWillAppear(_ animated: Bool) {
        pieGraphView.setNeedsDisplay()
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
