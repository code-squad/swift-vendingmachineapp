//
//  InspectorStackView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/05.
//

import UIKit

class InspectorStackView: UIStackView {
    
    var coinButtions : [UICoinButton]!
    var balanceLabel : UILabel!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        initSubViews()
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
        initSubViews()
    }
    func initSubViews(){
        setButtons()
        setBalanceLabel()
    }
    func setButtons(){
        coinButtions = [UICoinButton]()
        UICoinButton.Amount.allCases.forEach { (value) in
            let button = UICoinButton(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 10), with: value)
            coinButtions.append(button)
            self.addArrangedSubview(button)
        }
    }
    func setBalanceLabel(){
        balanceLabel = UILabel(frame: bounds)
        balanceLabel.text = "잔액 : 0"
        balanceLabel.font = .boldSystemFont(ofSize: 20)
        balanceLabel.textColor = .white
        balanceLabel.textAlignment = .center
        addArrangedSubview(balanceLabel)
    }
    func configure(){
        self.axis = .vertical
        self.translatesAutoresizingMaskIntoConstraints = false
        self.distribution = .fillEqually
        self.spacing = 10
    }
    func reloadBalanceLabelText(balance : Int){
        balanceLabel.text = "잔액 : \(balance)"
    }
}
