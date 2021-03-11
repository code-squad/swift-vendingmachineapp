//
//  VendingMachineUpdator.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation
import UIKit

protocol VendingMachineViewPresenter {
    
    func initialScreen(images: [UIImage], sampleView: ProductStackView, stackView: UIStackView, machine: VendingMachine, moneyLabel: UILabel)
    
    func updateStocks(machine: VendingMachine, countLabels: [UILabel], beverageList: [Shopable])
    
    func updateBalance(machine: VendingMachine, label: UILabel)
}

class VendingMachineViewUpdator: VendingMachineViewPresenter {
    
    func initialScreen(images: [UIImage], sampleView: ProductStackView, stackView: UIStackView, machine: VendingMachine, moneyLabel: UILabel) {
        
        newProductViews(with: images, sampleView: sampleView, stackView: stackView)
        updateBalance(machine: machine, label: moneyLabel)
    }
    
    private func newProductViews(with images: [UIImage], sampleView: ProductStackView, stackView: UIStackView) {
        
        stackView.arrangedSubviews.forEach { (sample) in
            sample.removeFromSuperview()
        }
    
        for image in images {
            let newView = productView(with: image, sampleView)
            stackView.addArrangedSubview(newView)
        }
    }
    
    private func productView(with image: UIImage,_ sampleView: ProductStackView) -> ProductStackView {
        
        let view = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(NSKeyedArchiver.archivedData(withRootObject: sampleView, requiringSecureCoding: false)) as! ProductStackView
        
        view.imageView.image = image

        return view
    }
    
    func updateStocks(machine: VendingMachine, countLabels: [UILabel], beverageList: [Shopable]) {
        let stockList = machine.allStocks()
        
        for (idx, beverage) in beverageList.enumerated() {
            let id = ObjectIdentifier(type(of: beverage))
            if let count = stockList[id] {
                countLabels[idx].text = "\(count)개"
            } else {
                countLabels[idx].text = "품절"
            }
        }
    }
    
    func updateBalance(machine: VendingMachine, label: UILabel) {
        label.text = "\(machine.moneyLeft())원"
    }
}
