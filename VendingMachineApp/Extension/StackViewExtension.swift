//
//  StackViewUtility.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/05.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views : UIView...){
        for view in views {
            addArrangedSubview(view)
        }
    }
}
