//
//  moneyView.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/19.
//

import UIKit

class MoneyView : UIView{
    private var MoneyaddButtons : [UIButton]!
    private var currentMoneyLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, moneyMethod : Selector) {
        super.init(frame: frame)
        initMoneyaddButtons(method: moneyMethod)
        initCurrentMoneyLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initMoneyaddButtons(method : Selector){
        for i in 0..<2 {
            MoneyaddButtons.append(UIButton())
            MoneyaddButtons[i].translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(MoneyaddButtons[i])
            MoneyaddButtons[i].setTitleColor(.systemBlue, for: .normal)
            MoneyaddButtons[i].widthAnchor.constraint(equalToConstant: 75).isActive = true
            MoneyaddButtons[i].heightAnchor.constraint(equalToConstant: 50).isActive = true
            MoneyaddButtons[i].centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            MoneyaddButtons[i].tag = i
            MoneyaddButtons[i].addTarget(self, action: method, for: .touchUpInside)
        }
        MoneyaddButtons[0].leftAnchor.constraint(equalTo: self.leftAnchor, constant: 35).isActive = true
        MoneyaddButtons[1].leftAnchor.constraint(equalTo: MoneyaddButtons[0].rightAnchor, constant: 25).isActive = true
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
        currentMoneyLabel.leftAnchor.constraint(equalTo: MoneyaddButtons[0].centerXAnchor).isActive = true
        currentMoneyLabel.centerYAnchor.constraint(equalTo: MoneyaddButtons[0].bottomAnchor, constant: 30).isActive = true
    }
    

}
