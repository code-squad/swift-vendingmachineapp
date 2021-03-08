//
//  InspectorStackView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/05.
//

import UIKit

class InspectorStackView: UIStackView {

    var coinButtions : [AddCoinUIButton]!
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
        
        // Coins Button
        coinButtions = [AddCoinUIButton]()
        coinButtions.append(AddCoinUIButton(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 10), named: "+1000원"))
        coinButtions.append(AddCoinUIButton(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 10), named: "+5000원"))
        coinButtions.forEach{ addArrangedSubview($0)}
        
        // Balance Label
        balanceLabel = UILabel(frame: bounds)
        balanceLabel.text = "잔액 : \(balance)"
        balanceLabel.font = .boldSystemFont(ofSize: 20)
        balanceLabel.textColor = .white
        balanceLabel.textAlignment = .center
        addArrangedSubview(balanceLabel)
    }
}
