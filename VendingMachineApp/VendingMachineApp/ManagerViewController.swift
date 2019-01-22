//
//  ManagerViewController.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 22..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

class ManagerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: - Methods
    //MARK: IBAction
    
    @IBAction func tapCloseButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapAddBeverageButton(_ sender: UIButton) {
        let tag = sender.tag
        guard let beverageType = Mapper.shared.mapping(by: tag) as? BeverageProduct.Type else { return }
        
        let product = Beverage.produce(product: beverageType)
        
        VendingMachine.sharedInstance.add(product: product)
    }
}
