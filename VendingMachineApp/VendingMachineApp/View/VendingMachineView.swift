//
//  VendingMachineView.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/13.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class VendingMachineView: UIView {

    @IBOutlet public var loadButtons: [UIButton]!
    @IBOutlet public var beverageCountLabels: [UILabel]!
    @IBOutlet public weak var balanceLabel: UILabel!
    
    public weak var datasource: VendingMachineDataSource?
    private var vendingMachine: VendingMachine!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .white
    }
    
    @IBAction private func load(_ sender: UIButton) {
        let firstTag = 1
        let oneThousands = 1000
        let fiveThousands = 5000
        datasource?.load(coin: sender.tag == firstTag ? oneThousands : fiveThousands)
    }
    
    @IBAction private func addBeverage(_ sender: UIButton) {
        datasource?.add(index: sender.tag)
    }
    
    public func update(balance: String) {
        balanceLabel.text = balance
    }
    
    public func update(tag: Int, counts: String) {
        beverageCountLabels[tag].text = counts
    }
}

protocol VendingMachineDataSource: NSObject {
    func load(coin: Int)
    func add(index: Int)
}
