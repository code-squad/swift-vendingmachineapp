//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/18.
//

import UIKit

class AdminViewController: UIViewController,AdminModable,VendingMachinedable {

    var vendingMachine : UserModable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    func setVendingMachine(_ vendingMachined: UserModable) {
        self.vendingMachine = vendingMachined
    }
    
    func addStock(_ beverage: Beverage) {
        
    }
}
