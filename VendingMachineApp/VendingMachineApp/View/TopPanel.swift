//
//  TopPanel.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/03/04.
//

import UIKit

protocol TopPanelDelegate: class {
    func didInsertedCoin(amound: Int)
}

class TopPanel: UIView {
    @IBOutlet weak var addOneThousandCoinButton: UIButton!
    @IBOutlet weak var addFiveThousandCoinButton: UIButton!
    @IBOutlet weak var leftCoinsLabel: UILabel!
    private lazy var amountEachButton: Dictionary<UIButton, Int> = [
        addOneThousandCoinButton: 1000,
        addFiveThousandCoinButton: 5000
    ]
    
    weak var delegate: TopPanelDelegate?
    
    @IBAction func touchAddCoinButton(_ sender: UIButton) {
        guard let amount = amountEachButton[sender] else { return }
        delegate?.didInsertedCoin(amound: amount)
    }
}

extension TopPanel {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
}
