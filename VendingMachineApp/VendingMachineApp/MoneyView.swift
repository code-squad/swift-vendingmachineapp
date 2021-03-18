//
//  moneyView.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/19.
//

import UIKit

class MoneyView : UIView{
    private var vendingMachine : VendingMachine!
    private let appDelegate : AppDelegate
    private var MoneyaddButtons : [UIButton]
    private var currentMoneyLabel : UILabel
    
    override init(frame: CGRect) {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.vendingMachine = appDelegate.vendingMachine
        MoneyaddButtons = []
        currentMoneyLabel = UILabel()
        super.init(frame: frame)
        initMoneyaddButtons()
        initCurrentMoneyLabel()
    }
    
    required init?(coder: NSCoder) {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        MoneyaddButtons = []
        currentMoneyLabel = UILabel()
        super.init(coder: coder)
    }
    
    func initMoneyaddButtons(){
        for i in 0..<2 {
            MoneyaddButtons.append(UIButton())
            MoneyaddButtons[i].translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(MoneyaddButtons[i])
            MoneyaddButtons[i].setTitleColor(.systemBlue, for: .normal)
            MoneyaddButtons[i].widthAnchor.constraint(equalToConstant: 75).isActive = true
            MoneyaddButtons[i].heightAnchor.constraint(equalToConstant: 50).isActive = true
            MoneyaddButtons[i].centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            MoneyaddButtons[i].tag = i
            MoneyaddButtons[i].addTarget(self, action: #selector(addMoney(sender:)), for: .touchUpInside)
        }
        MoneyaddButtons[0].leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        MoneyaddButtons[1].rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        MoneyaddButtons[0].setTitle("+1000원", for: .normal)
        MoneyaddButtons[1].setTitle("+5000원", for: .normal)
    }
    
    func initCurrentMoneyLabel() -> Void {
        currentMoneyLabel.text = "0원"
        currentMoneyLabel.textAlignment = .center
        currentMoneyLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(currentMoneyLabel)
        currentMoneyLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        currentMoneyLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        currentMoneyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        currentMoneyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 40).isActive = true
    }

    func updateMoeny(money: String){
        currentMoneyLabel.text = money
    }
    
    @objc private func addMoney(sender: UIButton){
        if let tempMoney = Money.moneyUnit.init(index: sender.tag) {
            vendingMachine.addMoney(money: Money.init(money: tempMoney))
        }
    }
}
