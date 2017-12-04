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
    let vendingMachineID = "VendingMachineViewController"
    var vendingMachine: VendingMachine!

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == vendingMachineID {
            guard let vendingMachineViewController = segue.destination as? VendingMachineViewController else {
                return
            }
            vendingMachine = VendingMachine()

            vendingMachineViewController.vendingMachine = vendingMachine
        }
    }

    func initButton() {
        addMoneyButtons.forEach { (button: UIButton) in
            button.layer.borderWidth = 1
            button.layer.masksToBounds = false
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = button.frame.height/2
            button.clipsToBounds = true
            if button.tag == 1 {
                button.addTarget(self, action: #selector(addTenMoneyButtonDidTap(_:)), for: .touchDown)
            }
            if button.tag == 2 {
                button.addTarget(self, action: #selector(addFiftyMoneyButtonDidTap(_:)), for: .touchDown)
            }
        }
    }

    // 천원 추가
    @objc func addTenMoneyButtonDidTap(_ sender: UIButton) {
        initUserMode()
        addMoney(1000)
        updateRemainMoneyLabel()
    }

    // 오천원 추가
    @objc func addFiftyMoneyButtonDidTap(_ sender: UIButton) {
        initUserMode()
        addMoney(5000)
        updateRemainMoneyLabel()
    }

    // User Mode로 초기화
    func initUserMode() {
        vendingMachine.exitMode()
        vendingMachine.assignMode(mode: .user)
    }

    func addMoney(_ money: Int) {
        do {
            try vendingMachine.add(detail: money)
        } catch let error {
            print(error)
        }
    }

    // 잔돈 라벨 업데이트
    func updateRemainMoneyLabel() {
        guard let menu = vendingMachine.makeMenu() else {
            remainMoneyLabel.text = "0"
            return
        }
        remainMoneyLabel.text = "\(numberFormatter.string(from: NSNumber(value: menu.money)) ?? "0")"
    }
    
}

