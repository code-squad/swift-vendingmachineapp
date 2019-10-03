//
//  BeverageCollectionViewCell.swift
//  VendingMachineApp
//
//  Created by CHOMINJI on 01/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

protocol BeverageCollectionViewCellDelegate: class {
    func addStock(with indexPath: IndexPath)
}

class BeverageCollectionViewCell: UICollectionViewCell {
    var indexPath: IndexPath!
    weak var delegate: BeverageCollectionViewCellDelegate?
    
    @IBOutlet weak var beverageImageView: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBAction func touchAddButton(_ sender: Any) {
        delegate?.addStock(with: indexPath)
    }
}
