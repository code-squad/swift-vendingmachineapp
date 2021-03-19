//
//  AddStockButtonViewModel.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/19.
//

import UIKit

class AddStockButtonViewModel: NSObject, ButtonViewModel {
    
    private let addStockButtonCollection: [UIButton]
    private var controllerHandler: ControlActionClosure
    
    init(with buttons: [UIButton]) {
        self.addStockButtonCollection = buttons
        self.controllerHandler = { (_, _) in }
        super.init()
        linkAction()
    }
    
    @IBAction func addStock(_ sender: UIButton) {
        guard let targetIndex = addStockButtonCollection.firstIndex(of: sender) else { return }
        controllerHandler(sender, targetIndex)
    }
    
    func bind(control action: @escaping ControlActionClosure) {
        self.controllerHandler = action
    }
    
    private func linkAction() {
        addStockButtonCollection.forEach { (button) in
            button.addTarget(self, action: #selector(addStock(_:)), for: .touchUpInside)
        }
    }
}
