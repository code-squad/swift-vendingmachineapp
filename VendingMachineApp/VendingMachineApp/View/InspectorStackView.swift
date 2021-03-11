//
//  InspectorStackView.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/03/11.
//

import UIKit

class InspectorStackView: UIStackView {
    
    var cashButtons: [UIButton] = [UIButton]()
    var moneyLabel: UILabel!
    var money: Int = 0 {
        didSet{
            moneyLabel.text = "잔액 : \(money)"
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    func setupLayout(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.distribution = .fillEqually
        self.spacing = 10
        setupButtons(titles: ["+ 1000원","+ 5000원"])
        setupLabel()
    }
    
    //MARK: 버튼 생성
    func setupButtons(titles:[String]){
        titles.forEach({ title in
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 30))
            button.setTitle(title, for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            button.layer.cornerRadius = 8
            button.layer.masksToBounds = true
            cashButtons.append(button)
            button.addTarget(self, action: #selector(addCash), for: .touchDown)
            self.addArrangedSubview(button)
        })
    }
    
    //MARK: 라벨 설정
    func setupLabel(){
        moneyLabel = UILabel(frame: bounds)
        moneyLabel.text = "잔액 : \(money)"
        moneyLabel.font = .boldSystemFont(ofSize: 25)
        moneyLabel.textColor = .white
        moneyLabel.textAlignment = .center
        moneyLabel.backgroundColor = .lightGray
        moneyLabel.layer.cornerRadius = 8
        moneyLabel.layer.masksToBounds = true
        addArrangedSubview(moneyLabel)
    }
    
    @objc func addCash(_ sender : UIButton){
        money += sender.titleLabel?.text?.extractIntegerFromString() ?? 0
    }
}
