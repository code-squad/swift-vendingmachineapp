//
//  ModelUpdater.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/03/16.
//

import UIKit

protocol MakingViewProtocol {
    func showAllBeverageList() -> [ObjectIdentifier: [Beverage]]
}

class VendingMachineInfo {
    private(set) var matchModelAndViewHelper: [ObjectIdentifier: BeverageView] = [:]
    private(set) var beverageTypeButtons: [UIButton: Beverage.Type] = [:]

    private var objectforMakingView: MakingViewProtocol
    
    init(with objectforMakingView: MakingViewProtocol) {
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
            }
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

