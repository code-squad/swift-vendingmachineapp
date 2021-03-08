//
//  BeverageImage.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/05.
//

import UIKit

class BeverageImageView: UIImageView {
    func setting() {
        self.frame = CGRect.init(x: 0, y: 0, width: 150, height: 100)
        self.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        self.translatesAutoresizingMaskIntoConstraints = true
        self.contentMode = .scaleAspectFit
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
    }
}
