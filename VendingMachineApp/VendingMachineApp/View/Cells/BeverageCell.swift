//
//  BeverageCell.swift
//  VendingMachineApp
//
//  Created by 이동건 on 29/10/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class BeverageCell: UICollectionViewCell {
    //MARK: Outlets
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            setImageViewRound()
        }
    }
    
    var addButtonDidTapped: (() -> ())?
    
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        countLabel.text = nil
        imageView.image = nil
    }
    
    //MARK: Setup
    func setup(_ handler: (UIImageView, UILabel) -> ()) {
        handler(self.imageView, self.countLabel)
    }
    
    private func setImageViewRound() {
        imageView.layer.cornerRadius = imageView.frame.height * 0.1
        imageView.layer.masksToBounds = true
    }
    
    //MARK: Actions
    @IBAction func addButtonDidTapped(_ sender: Any) {
        addButtonDidTapped?()
    }
}
