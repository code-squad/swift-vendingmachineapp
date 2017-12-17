//
//  ManagerModeContainerViewController.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 15..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class ManagerModeContainerViewController: UIViewController {
    @IBOutlet var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Actions

    @IBAction func closeButtonDidTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
