//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    private var vendingMachine = VendingMachine()
    
    @IBAction func insertCashOne(_ sender: Any) {
        vendingMachine.addCash(cash: 1000)
        updateTotalCash()
    }
    
    @IBAction func insertCashFive(_ sender: Any) {
        vendingMachine.addCash(cash: 5000)
        updateTotalCash()
    }
    
    @IBOutlet weak var totalCash: UILabel!
    
    private func updateTotalCash() {
        totalCash.text = "\(vendingMachine.showAccount())"
    }
    
    private func addMainStackView() {
        let skuStackView = SKUStackView()
        let mainStackView = skuStackView.makeMainStackView()
        self.view.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor, constant: 150).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMainStackView()
        updateTotalCash()
    }
}


