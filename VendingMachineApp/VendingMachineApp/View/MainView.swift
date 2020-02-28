//
//  MainView.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/28.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class MainView: UIView {

    var someDelegate: SomeDelegate?
    
    @IBOutlet var addBalanceButtons: [UIButton]!
    
    @IBAction func addBalanceButtonTapped(_ sender: UIButton) {
        someDelegate?.someFunction(someProperty: sender.tag)
    }
}
