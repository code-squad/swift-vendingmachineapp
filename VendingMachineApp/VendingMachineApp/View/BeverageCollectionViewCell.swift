//
//  BeverageCollectionViewCell.swift
//  VendingMachineApp
//
//  Created by CHOMINJI on 01/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

protocol BeverageCollectionViewCellDelegate: class {
    func beverageCell(_ cell: UICollectionViewCell, itemAt indexPath: IndexPath)
}

class BeverageCollectionViewCell: UICollectionViewCell {
    static let reuseID = "BeverageCollectionViewCell"
    var indexPath: IndexPath!
    weak var delegate: BeverageCollectionViewCellDelegate?
    
    @IBOutlet weak var beverageImageView: RoundImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBAction func touchButton(_ sender: Any) {
        delegate?.beverageCell(self, itemAt: indexPath)
    }
}
