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
        // Coins Button
        setButtons(titles: ["+1000원", "+5000원"])
        
        // Balance Label
        setBalanceLabel()
    }
    
    func setButtons(titles : [String]){
        coinButtions = [UICoinButton]()
        for title in titles {
            let button = UICoinButton(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 10))
            button.setTitle(title, for: .normal)
            button.coin = title.extractUnsignedInteger()
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
