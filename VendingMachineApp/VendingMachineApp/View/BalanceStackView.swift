//
//  BalanceStackView.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/08.
//

import UIKit

class BalanceStackView: UIStackView {
    
    let balanceLabel = UILabel.init()
    
    func setConfiguration() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.spacing = 10
        self.alignment = .center
        self.distribution = .fillProportionally
    }
    
    func collectSubelements() {
        let balanceButton_1000 = BalanceButton.init()
        balanceButton_1000.setCriteria(with: 1000)
        balanceButton_1000.addTarget(superview?.superview?.superview, action: #selector(ViewController.doAddBalance(sender:)), for: .touchUpInside)
        
        let balanceButton_5000 = BalanceButton.init()
        balanceButton_5000.setCriteria(with: 5000)
        balanceButton_5000.addTarget(superview?.superview?.superview, action: #selector(ViewController.doAddBalance(sender:)), for: .touchUpInside)
        
        balanceLabel.text = "0원"
        NotificationCenter.default.addObserver(self, selector: #selector(didBalanceChanged(_:)), name: .balanceChanged, object: nil)
        
        self.addArrangedSubview(balanceButton_1000)
        self.addArrangedSubview(balanceButton_5000)
        self.addArrangedSubview(balanceLabel)
    }
    
    @objc func didBalanceChanged(_ notification: Notification) {
        balanceLabel.text = "\(String(describing: notification.object!))원"
    }
}
