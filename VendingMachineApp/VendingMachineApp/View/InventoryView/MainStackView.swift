//
//  MainStackView.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/08.
//
import UIKit

//class SKUStackView: UIStackView {
//
//    var oneStackView: BeverageStackView!
//    var beverageStackView: [BeverageStackView]!
//    var skuList: [Beverage.Type] = [DrPepper.self, FantaOrange.self, Sprite.self, CantataAmericano.self, BlueBottle.self]
//
//    required init(coder: NSCoder) {
//        super.init(coder: coder)
//        addBeverageToStackView()
//        addBeverageViewToMainView()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        addBeverageToStackView()
//        addBeverageViewToMainView()
//    }
//
//    private func addBeverageToStackView() {
//        beverageStackView = [BeverageStackView]()
//        for i in 0...4 {
//            let oneStockview = BeverageStackView()
//            oneStockview.beverageImage.image = UIImage(named: "\(i).jpg")
//            oneStockview.beverageType = skuList[i]
//            oneStockview.beverageButton.beverageType = skuList[i]
//            beverageStackView.append(oneStockview)
//        }
//    }
//
//    private func addBeverageViewToMainView() {
//        self.axis = NSLayoutConstraint.Axis.horizontal
//        self.distribution = UIStackView.Distribution.fillProportionally
//        self.alignment = UIStackView.Alignment.center
//        self.spacing = 16.2
//        self.translatesAutoresizingMaskIntoConstraints = false
//        for i in 0...4 {
//            self.addArrangedSubview(beverageStackView[i])
//        }
//    }
//
//    public func setQuantity(dict: [ObjectIdentifier: [Beverage]]) {
//        beverageStackView.forEach( { sku in
//            let value = dict[ObjectIdentifier(sku.beverageType)]?.count ?? 0
//            sku.loadQuantity(quantity: value)
//        } )
//    }
//
//}

class SKUStackView: UIStackView {

    private var oneStackView: BeverageStackView!
    private var beverageStackView: [BeverageStackView]!
    private var skuList: [Beverage.Type] = [DrPepper.self, FantaOrange.self, Sprite.self, CantataAmericano.self, BlueBottle.self]
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        addBeverageToStackView()
        addBeverageViewToMainView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBeverageToStackView()
        addBeverageViewToMainView()
    }
    
    private func addBeverageToStackView() {
        beverageStackView = [BeverageStackView]()
        for i in 0..<skuList.count {
            let oneStockview = BeverageStackView()
            oneStockview.deliverImage().image = UIImage(named: "\(i).jpg")
            oneStockview.beverageType = skuList[i]
            oneStockview.deliverButton().beverageType = skuList[i]
            beverageStackView.append(oneStockview)
        }
    }
    
    private func addBeverageViewToMainView() {
        self.axis = NSLayoutConstraint.Axis.horizontal
        self.distribution = UIStackView.Distribution.fillProportionally
        self.alignment = UIStackView.Alignment.center
        self.spacing = 16.2
        self.translatesAutoresizingMaskIntoConstraints = false
        for i in 0...4 {
            self.addArrangedSubview(beverageStackView[i])
        }
    }
    
    public func setQuantity(dict: [ObjectIdentifier: [Beverage]]) {
        beverageStackView.forEach( { sku in
            let value = dict[ObjectIdentifier(sku.beverageType)]?.count ?? 0
            sku.loadQuantity(quantity: value)
        } )
    }

}
