//
//  VendingMachineUpdator.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation
import UIKit

protocol VendingMachinePresenter {
    
    func didTurnOn(images: [UIImage], sampleView: ProductStackView, stackView: UIStackView, machine: VendingMachine, beverageList: [Shopable], moneyLabel: UILabel)
    
    func didAddStockTouched(for beverage: Shopable, machine: VendingMachine)
    
    func didAddMoneyTouched(amount: Int, machine: VendingMachine)
    
}

class VendingMachineUpdator: VendingMachinePresenter {
    
    func didAddMoneyTouched(amount: Int, machine: VendingMachine) {
        machine.insert(money: amount)
    }
    
    func didAddStockTouched(for beverage: Shopable, machine: VendingMachine) {
        machine.addStock(of: beverage)
    }
    
    func didTurnOn(images: [UIImage], sampleView: ProductStackView, stackView: UIStackView, machine: VendingMachine, beverageList: [Shopable], moneyLabel: UILabel) {
        
        moneyLabel.text = "\(machine.moneyLeft())원"
        
        stackView.arrangedSubviews.forEach { (sample) in
            sample.removeFromSuperview()
        }
    
        for (idx, image) in images.enumerated() {
            let target = beverageList[idx]
            let id = ObjectIdentifier(type(of: target))
            let count = machine.allStocks()[id]
            
            let newView = productView(with: image, sampleView, count)
            stackView.addArrangedSubview(newView)
        }
    }
    
    private func productView(with image: UIImage,_ sampleView: ProductStackView, _ count: Int?) -> ProductStackView {
        
        let view = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(NSKeyedArchiver.archivedData(withRootObject: sampleView, requiringSecureCoding: false)) as! ProductStackView
        
        view.imageView.image = image
    
        if let count = count {
            view.countLabel.text = "\(count)개"
        } else {
            view.countLabel.text = "품절"
        }
        return view
    }
}
