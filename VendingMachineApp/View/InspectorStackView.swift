//
//  InspectorStackView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/05.
//

import UIKit

class InspectorStackView: UIStackView {

    var oneThousandButton : UIButton!
    var fiveThousandButton : UIButton!
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
        
        oneThousandButton = UIButton(type: .system)
        oneThousandButton.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 10)
        oneThousandButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        oneThousandButton.setTitle("+1000원", for: .normal)
        oneThousandButton.addTarget(self, action: #selector(addCoin), for: .touchUpInside)
        addArrangedSubview(oneThousandButton)
        
        fiveThousandButton = UIButton(type: .system)
        fiveThousandButton.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 10)
        fiveThousandButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        fiveThousandButton.addTarget(self, action: #selector(addCoin), for: .touchUpInside)
        fiveThousandButton.setTitle("+5000원", for: .normal)
        addArrangedSubview(fiveThousandButton)
        
        balanceLabel = UILabel(frame: oneThousandButton.bounds)
        balanceLabel.text = "잔액 : \(balance)"
        balanceLabel.font = .boldSystemFont(ofSize: 20)
        balanceLabel.textColor = .white
        balanceLabel.textAlignment = .center
        addArrangedSubview(balanceLabel)

    }
    
    @objc func addCoin(_ sender : UIButton!){
        let value : Int = balance + (sender.titleLabel?.text?.extractUnsignedInteger() ?? 0)
        balance += value
    }
}
