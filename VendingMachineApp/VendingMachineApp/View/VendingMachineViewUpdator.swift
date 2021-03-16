//
//  VendingMachineUpdator.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import UIKit

protocol VendingMachineViewPresenter {
    
    func initialScreen(images: [UIImage], sampleView: ProductStackView, stackView: UIStackView, machine: VendingMachine, moneyLabel: UILabel)
    
    func updateStocks(machine: VendingMachine, countLabels: [UILabel], beverageList: [Shopable])
    
    func updateBalance(machine: VendingMachine, label: UILabel)
    
    func updateDispensedList(machine: VendingMachine, scrollView: UIScrollView, images: [UIImage], beverages: [Shopable])
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
    
    func updateDispensedList(machine: VendingMachine, scrollView: UIScrollView, images: [UIImage], beverages: [Shopable]) {
        
        for views in scrollView.subviews {
            views.removeFromSuperview()
        }
        
        let purchased = machine.purchased()
        let count = purchased.count
        let sizeUnit: CGFloat = 200
        let yPosition = scrollView.bounds.height/2 - sizeUnit/2
        scrollView.contentSize.width = CGFloat(count + 1) * sizeUnit/2
        
        for i in 1...count {
            let targetIdx = beverages.firstIndex { (listItem) -> Bool in
                ObjectIdentifier(type(of: listItem)) == ObjectIdentifier(type(of: purchased[count-i]))
            }
            
            if let targetIdx = targetIdx {
                let newView = UIImageView(frame: CGRect(x: CGFloat(i-1) * sizeUnit/2, y: yPosition, width: sizeUnit, height: sizeUnit))
                newView.image = images[targetIdx]
                newView.contentMode = .scaleAspectFit
                scrollView.addSubview(newView)
            }
        }
    }
}
