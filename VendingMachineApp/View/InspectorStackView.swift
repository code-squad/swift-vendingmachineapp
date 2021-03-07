//
//  InspectorStackView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/05.
//

import UIKit

class InspectorStackView: UIStackView {

    var oneThousandButton : AddCoinUIButton!
    var fiveThousandButton : AddCoinUIButton!
    var balanceLabel : UILabel!
    var balance : Int  = 0
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        initSubViews()
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        initSubViews()
    }

    func initSubViews(){
        
        self.axis = .vertical
        self.translatesAutoresizingMaskIntoConstraints = false
        self.distribution = .fillEqually
        
        oneThousandButton = AddCoinUIButton(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 10), named: "+1000원")
        oneThousandButton.delegate = self
        addArrangedSubview(oneThousandButton)
        
        fiveThousandButton = AddCoinUIButton(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 10), named: "+5000원")
        fiveThousandButton.delegate = self
        addArrangedSubview(fiveThousandButton)
        
        balanceLabel = UILabel(frame: oneThousandButton.bounds)
        balanceLabel.text = "잔액 : \(balance)"
        balanceLabel.font = .boldSystemFont(ofSize: 20)
        balanceLabel.textColor = .white
        balanceLabel.textAlignment = .center
        addArrangedSubview(balanceLabel)

    }
}

extension InspectorStackView : CoinDelegate {
    
    func addCoin(_ sender: UIButton) {
        let value : Int = (sender.titleLabel?.text?.extractUnsignedInteger() ?? 0)
        balance += value
        print(balance)
    }
}
