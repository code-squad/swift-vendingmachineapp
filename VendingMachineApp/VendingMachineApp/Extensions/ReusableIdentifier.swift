//
//  ReusableIdentifier.swift
//  VendingMachineApp
//
//  Created by 이동건 on 30/10/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
