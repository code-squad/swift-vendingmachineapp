//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by 김수현 on 2018. 7. 17..
//  Copyright © 2018년 김수현. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
