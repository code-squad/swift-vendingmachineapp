//
//  BeverageCollectionViewCell.swift
//  VendingMachineApp
//
//  Created by CHOMINJI on 01/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

protocol BeverageCollectionViewCellDelegate: class {
    func beverageCell(_ cell: UICollectionViewCell, addItemAt indexPath: IndexPath)
    func beverageCell(_ cell: UICollectionViewCell, purchaseItemAt indexPath: IndexPath)
}

class BeverageCollectionViewCell: UICollectionViewCell {
    var indexPath: IndexPath!
    weak var delegate: BeverageCollectionViewCellDelegate?
    
    @IBOutlet weak var beverageImageView: RoundImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBAction func touchAddButton(_ sender: Any) {
        delegate?.beverageCell(self, addItemAt: indexPath)
    }
    
    @IBAction func touchPurchaseButton(_ sender: Any) {
        delegate?.beverageCell(self, purchaseItemAt: indexPath)
    }
}
