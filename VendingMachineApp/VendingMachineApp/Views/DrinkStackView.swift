//
//  DrinkStackView.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/03/19.
//

import UIKit

class DrinkStackView: UIView {
    
    private var drink: Drink.Type?
    private let imageNameForDrink = [ObjectIdentifier(BananaMilk.self): "banana_milk",
                                     ObjectIdentifier(Cantata.self): "cantata_coffee",
                                     ObjectIdentifier(Fanta.self): "fanta"]
    
    var drinkStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let add: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self, action: #selector(addStock), for: .touchUpInside)
        return button
    }()
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 15
        return image
    }()
    
    let stock: UILabel = {
        let label = UILabel()
        label.text = "0개"
        return label
    }()
    
    private let purchaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("구매", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(purchase), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drinkStackView.addArrangedSubview(add)
        drinkStackView.addArrangedSubview(image)
        drinkStackView.addArrangedSubview(stock)
        drinkStackView.addArrangedSubview(purchaseButton)
        self.addSubview(drinkStackView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for drink: Drink.Type) {
        self.drink = drink
        setImage(for: drink)
    }
    
    func setImage(for drink: Drink.Type) {
        if let imageName = imageNameForDrink[ObjectIdentifier(drink)] {
            image.image = UIImage(named: imageName)
        }
    }
    
    func updateStockLabel(notification: Notification) {
        guard let drink = drink,
              let dict = notification.userInfo?["stock"] as? [ObjectIdentifier: [Drink]],
              let stock = dict[ObjectIdentifier(drink)] else {
            return
        }
        self.stock.text = "\(stock.count)개"
    }
    
    @objc func addStock() {
        guard let type = drink,
              let drink = DrinkFactory.createDrink(for: type) else {
            return
        }
        VendingMachine.shared.addStock(for: drink)
    }
    
    @objc func purchase() {
        guard let drink = drink else {
            return
        }
        VendingMachine.shared.purchase(drink: drink)
    }
}
