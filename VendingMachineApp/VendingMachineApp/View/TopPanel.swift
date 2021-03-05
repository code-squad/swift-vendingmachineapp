//
//  TopPanel.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/03/04.
//

import UIKit

protocol TopPanelDelegate: class {
    func didInsertedCoin(amound: Int)
}

class TopPanel: UIView {
    @IBOutlet weak var addOneThousandCoinButton: UIButton!
    @IBOutlet weak var addFiveThousandCoinButton: UIButton!
    @IBOutlet weak var leftCoinsLabel: UILabel!
    
    weak var delegate: TopPanelDelegate?
    
    @IBAction func touchAddCoinButton(_ sender: UIButton) {
        delegate?.didInsertedCoin(amound: sender.tag)
    }
}
