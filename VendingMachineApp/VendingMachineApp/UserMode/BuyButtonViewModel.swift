//
//  UserViewModel.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/19.
//

import UIKit

class BuyButtonViewModel: NSObject, ButtonViewModel {
    
    private let buyButtonCollection: [UIButton]
    private var controllerHandler: ControlActionClosure
    
    init(with buttons: [UIButton]) {
        self.buyButtonCollection = buttons
        self.controllerHandler = { (_, _) in }
        super.init()
        linkAction()
    }
    
    @IBAction func buy(_ sender: UIButton) {
        guard let targetIndex = buyButtonCollection.firstIndex(of: sender) else { return }
        controllerHandler(sender, targetIndex)
    }

    func bind(control action: @escaping ControlActionClosure) {
        self.controllerHandler = action
    }
    
    private func linkAction() {
        buyButtonCollection.forEach { (button) in
            button.addTarget(self, action: #selector(buy(_:)), for: .touchUpInside)
        }
    }
}
