//
//  ChargeViewModel.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/19.
//

import UIKit

class ChargeButtonViewModel: NSObject, ButtonViewModel {
    
    @IBOutlet var chargeButtonCollection: [UIButton]!
    private var controllerHandler: ControlActionClosure
    
    override init() {
        controllerHandler = { (_, _) in }
        super.init()
    }
    
    @IBAction func charge(_ sender: UIButton) {
        guard let targetIndex = chargeButtonCollection.firstIndex(of: sender) else { return }
        controllerHandler(sender, targetIndex)
    }
    
    func bind(control action: @escaping ControlActionClosure) {
        self.controllerHandler = action
    }
}
