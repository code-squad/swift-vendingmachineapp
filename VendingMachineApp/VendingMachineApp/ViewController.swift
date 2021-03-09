//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/25.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    private var vendingMachine = VendingMachine()
    
    @IBAction func insertCashOne(_ sender: Any) {
        vendingMachine.addCash(cash: 1000)
        updateTotalCash()
        a()
    }
    
    @IBAction func insertCashFive(_ sender: Any) {
        vendingMachine.addCash(cash: 5000)
        updateTotalCash()
        a()
    }
    
    @IBOutlet weak var totalCash: UILabel!
    
    func a() {
        UserDefaults.standard.set(totalCash.text, forKey: "cashState")
    }
    
    private func updateTotalCash() {
        totalCash.text = "\(vendingMachine.showAccount())"
    }
    
    private func addMainStackView() {
        let skuStackView = SKUStackView()
        let mainStackView = skuStackView.makeMainStackView()
        self.view.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 150).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMainStackView()
        updateTotalCash()
        totalCash.text = UserDefaults.standard.string(forKey: "cashState")
    }
    
}
