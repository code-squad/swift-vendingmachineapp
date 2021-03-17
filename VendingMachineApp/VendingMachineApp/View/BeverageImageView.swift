//
//  BeverageImage.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/05.
//

import UIKit

class BeverageImageView: UIImageView {
    func setConfiguration() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleToFill
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
    }
}
