//
//  CornerRoundedView.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

@IBDesignable
final class CornerRoundedView: UIView {
    @IBInspectable private var cornerRadius: CGFloat = 0 {
        didSet { configureCornerRadius() }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCornerRadius()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCornerRadius()
    }
    
    private func configureCornerRadius() {
        layer.cornerRadius = cornerRadius
    }
}
