//
//  stock.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/18.
//

import UIKit

class StockView : UIView {
    private var vendingMachine : VendingMachine!
    private let appDelegate : AppDelegate
    private var addButton : UIButton!
    private var beverageImage : UIImageView!
    private var stockLabel : UILabel!
    private var purchaseButton : UIButton!
    
    enum stockTitle : String, CaseIterable {
        case bananaMilk = "BananaMilk", strawberryMilk = "StrawberryMilk", somersby = "somersby", coke = "coke", HOT6 = "HOT6", Monster = "Monster", CaffeMocha = "CaffeMocha", CafeLatte = "CafeLatte"
    }
    
    override init(frame : CGRect) {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        super.init(frame: frame)
    }
    
    init(frame : CGRect, ImageName : stockTitle) {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.vendingMachine = appDelegate.vendingMachine
        self.addButton = UIButton()
        self.beverageImage = UIImageView(image: UIImage(named: ImageName.rawValue))
        self.purchaseButton = UIButton()
        self.stockLabel = UILabel()
        super.init(frame: frame)
        setupAddButton()
        setupImage()
        setupstockLabel()
        setupPurchaseButton()
    }
    
    required init?(coder: NSCoder) {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        super.init(coder: coder)
    }
    
    private func setupImage(){
        self.beverageImage.backgroundColor = .white
        self.addSubview(self.beverageImage)
        self.beverageImage.translatesAutoresizingMaskIntoConstraints = false
        self.beverageImage.widthAnchor.constraint(equalToConstant: 140).isActive = true
        self.beverageImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.beverageImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.beverageImage.topAnchor.constraint(equalTo: self.addButton.bottomAnchor, constant: 5).isActive = true
        self.beverageImage.contentMode = .scaleAspectFit
        self.beverageImage.layer.cornerRadius = 10
    }
    
    private func setupAddButton(){
        self.addButton.setTitle("추가", for: .normal)
        self.addButton.setTitleColor(.systemBlue, for: .normal)
        self.addSubview(self.addButton)
        self.addButton.translatesAutoresizingMaskIntoConstraints = false
        self.addButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.addButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.addButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        self.addButton.addTarget(self, action: #selector(addBeverage(sender:)), for: .touchUpInside)
    }
    
    private func setupPurchaseButton(){
        self.purchaseButton.setTitle("구매", for: .normal)
        self.purchaseButton.setTitleColor(.systemBlue, for: .normal)
        self.addSubview(self.purchaseButton)
        self.purchaseButton.translatesAutoresizingMaskIntoConstraints = false
        self.purchaseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.purchaseButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.purchaseButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.purchaseButton.topAnchor.constraint(equalTo: self.stockLabel.bottomAnchor, constant: 10).isActive = true
        self.purchaseButton.addTarget(self, action: #selector(buyBeverage(sender:)), for: .touchUpInside)
    }
    
    
    private func setupstockLabel(){
        self.stockLabel.text = "0개"
        self.stockLabel.textAlignment = .center
        self.addSubview(self.stockLabel)
        self.stockLabel.translatesAutoresizingMaskIntoConstraints = false
        self.stockLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.stockLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        self.stockLabel.centerXAnchor.constraint(equalTo: self.beverageImage.centerXAnchor).isActive = true
        self.stockLabel.topAnchor.constraint(equalTo: self.beverageImage.bottomAnchor, constant: 5).isActive = true
    }
    
    func updateStocklabel(stockCount : Int){
        self.stockLabel.text = "\(stockCount)개"
    }
    
    func setaddButtontag(tag : Int){
        self.addButton.tag = tag
    }

    func setpurchaseButtontag(tag : Int){
        self.purchaseButton.tag = tag
    }
    
    @objc private func addBeverage(sender : UIButton){
        let tempBeverage = vendingMachine.sendBeverageInFactory(index: sender.tag)
        vendingMachine.addBeverage(beverage: tempBeverage)
    }
    
    @objc private func buyBeverage(sender: UIButton){
        let tempBeverage = vendingMachine.sendBeverageInFactory(index: sender.tag)
        vendingMachine.buyBeverage(beverage: tempBeverage)
    }
}
