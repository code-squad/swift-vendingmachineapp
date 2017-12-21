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
        let pieces = PiecesFactory().makePieces()
        pieGraphView.pieces = pieces
    }

    override func becomeFirstResponder() -> Bool {
        return true
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            pieGraphView.graphState = .none
        }
    }

    // MARK: Events

    @IBAction func backButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
