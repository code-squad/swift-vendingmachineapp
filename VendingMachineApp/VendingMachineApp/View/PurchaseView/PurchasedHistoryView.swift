//
//  PurchasedHistoryView.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/19.
//

import UIKit

class PurchasedHistoryView: UIScrollView {
    
    private var purchasedBeverageView: UIImageView!

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureScrollView()
        configurePurchasedBeverageImage()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureScrollView()
        configurePurchasedBeverageImage()
    }
    
    private func configureScrollView() {
        self.backgroundColor = .gray
        self.isScrollEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentSize = CGSize(width: 120, height: 120)
    }
    
    private func configurePurchasedBeverageImage() {
        purchasedBeverageView = UIImageView()
        purchasedBeverageView.layer.cornerRadius = 16.2
        purchasedBeverageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        purchasedBeverageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    public func getImage(image: UIImage) {
        configurePurchasedBeverageImage()
        purchasedBeverageView.image = image
        purchasedBeverageView.layer.cornerRadius = 16.2
        purchasedBeverageView.clipsToBounds = true
        purchasedBeverageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        purchasedBeverageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.addSubview(purchasedBeverageView)
    }
    
}
