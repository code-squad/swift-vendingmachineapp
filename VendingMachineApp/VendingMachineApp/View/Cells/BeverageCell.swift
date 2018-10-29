//
//  BeverageCell.swift
//  VendingMachineApp
//
//  Created by 이동건 on 29/10/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class BeverageCell: UICollectionViewCell {
    //MARK: Properties
    private var bundle: Bundle?
    
    //MARK: Outlets
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            setImageViewRound()
        }
    }
    
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        setup()
    }
    
    //MARK: Setup
    func setup(bundle: Bundle? = nil ) {
        self.bundle = bundle
        self.imageView.image = UIImage(named: bundle?.beverage.className ?? "")
        self.countLabel.text = "\(bundle?.count ?? 0)개"
    }
    
    private func setImageViewRound() {
        imageView.layer.cornerRadius = imageView.frame.height * 0.1
        imageView.layer.masksToBounds = true
    }
    
    //MARK: Actions
    @IBAction func addButtonDidTapped(_ sender: Any) {
        guard let bundle = bundle else { return }
        NotificationCenter.default.post(name: VendingMachineNotification.didAdd.name, object: bundle.beverage.className)
    }
}
