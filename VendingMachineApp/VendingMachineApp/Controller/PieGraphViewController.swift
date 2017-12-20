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
        let pieces = PiecesFactory.makePieces(with: countOfPhurchases)
        pieGraphView.pieces = pieces
    }
    
    @IBAction func backButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
