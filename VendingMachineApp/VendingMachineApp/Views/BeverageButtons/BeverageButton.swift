//
//  PlusBeverageButton.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class BeverageButton: UIButton, BeverageGeneratable {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureImageView()
    }
    
    private func configureImageView() {
        configureImage()
        configureImageViewContentMode()
        configureImageEdgeInsets()
    }
    
    private func configureImage() {
        let createImage = UIImage(systemName: "plus.circle")
        setImage(createImage, for: .normal)
    }
    
    private func configureImageViewContentMode() {
        imageView?.contentMode = .scaleAspectFill
    }
    
    private func configureImageEdgeInsets() {
        let constant: CGFloat = 25
        imageEdgeInsets =  UIEdgeInsets(
            top: constant,
            left: constant,
            bottom: constant,
            right: constant
        )
    }
    
    func beverage() -> Beverage? { return nil }
}
