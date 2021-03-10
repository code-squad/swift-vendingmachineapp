//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    let vendingMachineView = VendingMachineView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    var vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vendingMachine.initialStock(howMany :3)
        let stockList = vendingMachine.showStock()
        
        vendingMachineView.setting(with: stockList)
        self.view.addSubview(vendingMachineView)
    }
}
