//
//  RoundedCornersImageView.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 11/01/2019.
//  Copyright © 2019 윤지영. All rights reserved.
//

import UIKit

class RoundedCornersImageView: UIImageView {

    override init(image: UIImage?) {
        super.init(image: image)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        roundCorners()
    }

    private func roundCorners() {
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }

}
