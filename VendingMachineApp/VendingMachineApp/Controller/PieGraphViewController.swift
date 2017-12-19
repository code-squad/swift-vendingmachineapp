//
//  PieGraphViewController.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 18..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class PieGraphViewController: UIViewController {
    @IBOutlet var pieGraphView: PieGraphView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let countOfPhurchases = VendingMachine.sharedInstance.countOfPhurchases()
        var pieces = [Piece]()
        for dictionary in countOfPhurchases {
            pieces.append(Piece(category: dictionary.key.typeOfProduct, value: CGFloat(dictionary.value)))
        }
        pieGraphView.pieces = pieces
    }
}
