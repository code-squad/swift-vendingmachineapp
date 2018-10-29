//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 이동건 on 29/10/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

protocol VendingMachineHandlerDelegate: class {
    associatedtype Menu
    func handle(_ menu: Menu, value: Int) throws -> Comment?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

