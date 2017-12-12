//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 11. 28..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 잔돈 추가 컨트롤러 -> User Mode
    @IBOutlet var remainMoneyLabel: UILabel!
    @IBOutlet var addMoneyButtons: [UIButton]!
    var vendingMachine = VendingMachine.sharedInstance

    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateMoneyLabel()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.updateRemainMoneyLabel(noti:)),
                                               name: .didChangeMoneyNotification,
                                               object: nil)
        makeButton()
    }

    private func makeButton() {
        addMoneyButtons.forEach { (button: UIButton) in
            button.layer.borderWidth = 1
            button.layer.masksToBounds = false
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = button.frame.height/2
            button.clipsToBounds = true
            button.addTarget(self,
                             action: #selector(addMoneyButtonDidTap(_:)),
                             for: .touchDown)
        }
    }

    private func updateMoneyLabel() {
        let remains = vendingMachine.remainMoney()
        remainMoneyLabel.text = "\(numberFormatter.string(from: NSNumber(value: remains)) ?? "0")"
    }

    // 음료수를 구매하기 위한 금액 추가 이벤트
    @objc private func addMoneyButtonDidTap(_ sender: UIButton) {
        vendingMachine.add(.user, detail: sender.tag)
    }

    // 잔돈 라벨 업데이트
    @objc private func updateRemainMoneyLabel(noti: Notification?) {
        updateMoneyLabel()
    }
    
}

