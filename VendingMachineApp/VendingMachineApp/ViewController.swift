//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    let machine = Machine()
    
    @IBOutlet weak var moneyOnTransactionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moneyOnTransactionLabel.text = "100000원"
    }
    
    @IBAction func thousandWonPlusButtonPressed(_ sender: UIButton) {
    print("thousandWonPlusPressed")
    }
    
    @IBAction func fiveThousandWonPlusButtonPressed(_ sender: UIButton) {
    print("fiveThousnadWonPlusPressed")
    }
    
}

