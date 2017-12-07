//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 11. 28..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AppDelegateAccessable {
    // 잔돈 추가 컨트롤러 -> User Mode
    @IBOutlet var remainMoneyLabel: UILabel!
    @IBOutlet var addMoneyButtons: [UIButton]!
    private let vendingMachineID = "VendingMachineViewController"

    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initButton()
        updateRemainMoneyLabel()
    }

    private func initButton() {
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

    // 음료수를 구매하기 위한 금액 추가 이벤트
    @objc func addMoneyButtonDidTap(_ sender: UIButton) {
        initUserMode()
        addMoney(sender.tag)
        updateRemainMoneyLabel()
    }

    // User Mode로 초기화
    private func initUserMode() {
        appDelegate.vendingMachine.exitMode()
        appDelegate.vendingMachine.assignMode(mode: .user)
    }

    private func addMoney(_ money: Int) {
        do {
            try appDelegate.vendingMachine.add(detail: money)
        } catch let error {
            print(error)
        }
    }

    // 잔돈 라벨 업데이트
    private func updateRemainMoneyLabel() {
        guard let menu = appDelegate.vendingMachine.makeMenu() else {
            remainMoneyLabel.text = "0"
            return
        }
        remainMoneyLabel.text = "\(numberFormatter.string(from: NSNumber(value: menu.money)) ?? "0")"
    }
    
}

