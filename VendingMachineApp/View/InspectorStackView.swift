//
//  InspectorStackView.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/05.
//

import UIKit

class InspectorStackView: UIStackView {

    var coinButtions : [UIButton]!
    var balanceLabel : UILabel!
    var balance : Int  = 0
    
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
        coinButtions = [UIButton]()
        for title in titles {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 10))
            button.setImage(UIImage(named: "button"), for: .normal)
            button.setTitle(title, for: .normal)
            coinButtions.append(button)
            button.addTarget(self, action: #selector(addCoin), for: .touchDown)
            self.addArrangedSubview(button)
        }
    }
    
    func setBalanceLabel(){
        balanceLabel = UILabel(frame: bounds)
        balanceLabel.text = "잔액 : \(balance)"
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
    
    func setTarget(_ controller : ViewController) {
//        coinButtions.forEach{ $0.delegate = controller }
    }
    @objc func addCoin(_ sender : UIButton){
        balance += sender.titleLabel?.text?.extractUnsignedInteger() ?? 0
    }
}
