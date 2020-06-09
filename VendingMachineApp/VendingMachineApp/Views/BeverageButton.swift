//
//  PlusBeverageButton.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class BeverageButton: UIButton, BeverageTagControl {
    var beverageItemByTag: BeverageItemByTag?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
        configureBeverageItemByTag()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureImageView()
        configureBeverageItemByTag()
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
    
    private func configureBeverageItemByTag() {
        beverageItemByTag = BeverageItemByTag(rawValue: tag)
    }
}
