//
//  VendingMachineViewController.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 11. 30..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class VendingMachineViewController: UIViewController {
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet var inventoryLable: [UILabel]!
    var vendingMachine: VendingMachine!

    override func viewDidLoad() {
        super.viewDidLoad()
        initManagerMode()
        self.imageViews.forEach { (imageView: UIImageView) in
            let tap = UITapGestureRecognizer(target: self, action: #selector(VendingMachineViewController.drinkViewDidTap))
            imageView.addGestureRecognizer(tap)
            imageView.isUserInteractionEnabled = true
        }
        updateInventory()
    }

    func initManagerMode() {
        vendingMachine = VendingMachine()
        do {
            try vendingMachine.assignMode(mode: 1)
        } catch let error {
            print(error)
        }

    }

    @objc func drinkViewDidTap(_ recognizer: UITapGestureRecognizer) {
        if let imageView = recognizer.view as? UIImageView {
            vendingMachine.action(action: Action(option: 1, detail: imageView.tag)!)
        }
        updateInventory()
    }

    func updateInventory() {
        let menuContents = vendingMachine.makeMenu()
        for lable in inventoryLable.enumerated() {
            guard let drink = menuContents?.menu[lable.offset] else {
                continue
            }
            lable.element.text = "\(menuContents?.inventory[drink] ?? 0 )"
        }
    }
}
