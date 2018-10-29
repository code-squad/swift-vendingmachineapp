//
//  BeverageCell.swift
//  VendingMachineApp
//
//  Created by 이동건 on 29/10/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class BeverageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height * 0.1
            imageView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var countLabel: UILabel!
    private var bundle: Bundle!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(bundle: Bundle) {
        self.bundle = bundle
        self.imageView.image = UIImage(named: bundle.beverage.className)
        self.countLabel.text = "\(bundle.count)개"
    }
    
    @IBAction func addButtonDidTapped(_ sender: Any) {
    }
}
