//
//  BeverageCell.swift
//  VendingMachineApp
//
//  Created by 이동건 on 29/10/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class BeverageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var countLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBAction func addButtonDidTapped(_ sender: Any) {
    }
}
