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
    var vendingMachine: VendingMachine!

    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateRemainMoneyLabel()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "VendingMachineViewController" {
            guard let vendingMachineViewController = segue.destination as? VendingMachineViewController else {
                return
            }
            vendingMachine = VendingMachine()

            vendingMachineViewController.vendingMachine = vendingMachine
        }
    }

    // 천원 추가
    @IBAction func addTenMoneyButtonDidTap(_ sender: UIButton) {
        initUserMode()
        addMoney(1000)
        updateRemainMoneyLabel()
    }

    // 오천원 추가
    @IBAction func addFiftyMoneyButtonDidTap(_ sender: UIButton) {
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

