//
//  ModelUpdater.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/16.
//

import UIKit

protocol makingViewProtocol {
    func showAllBeverageList() -> [ObjectIdentifier: [Beverage]]
}

class VendingMachineInfo {
    private(set) var matchModelAndViewHelper: [ObjectIdentifier: BeverageView] = [:]
    private(set) var beverageTypeButtons: [UIButton: Beverage.Type] = [:]
    private(set) var beverageStockLabels: [UIButton: UILabel] = [:]
    private var objectforMakingView: makingViewProtocol
    
    init(with objectforMakingView: makingViewProtocol) {
        self.objectforMakingView = objectforMakingView
        self.renewVendingMachineInfo()
    }
    
    public func renewVendingMachineInfo() {
        matchModelAndViewHelper.removeAll()
        
        let beverages = objectforMakingView.showAllBeverageList()
        beverages.keys.forEach { key in
            if let beverage = beverages[key]?.first {
                let image = UIImage(named: beverage.name) ?? UIImage()
                let text = "\(beverages[key]?.count ?? 0)"
                let beverageView =  BeverageView(beverageImage: image, stockLabelText: text )
                
                matchModelAndViewHelper[key] = beverageView
                beverageTypeButtons[beverageView.addButton] = type(of: beverage)
                beverageStockLabels[beverageView.addButton] = beverageView.stockLabel
            }
        }
    }
    
    public func repeatForButton(closure: (UIButton)->()) {
        renewVendingMachineInfo()
        
        beverageTypeButtons.keys.forEach { key in
            closure(key)
        }
    }
    
    public func repeatForBeverageView(closure: (BeverageView)->()) {
        renewVendingMachineInfo()
        
        matchModelAndViewHelper.keys.forEach { (objectIdentifier) in
            guard let beverageView = matchModelAndViewHelper[objectIdentifier] else { return }
            closure(beverageView)
        }
    }
}

