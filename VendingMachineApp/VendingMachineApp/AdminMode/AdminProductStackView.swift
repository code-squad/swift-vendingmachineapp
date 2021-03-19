//
//  AdminProductStackView.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/19.
//

import UIKit

class AdminProductStackView: UIStackView {

    func configure(with sampleViewData: [Data]) {
        sampleViewData.forEach { (data) in
            let object = ArchivingCenter.unarchive(with: data)

            guard object != nil,
                  let productView = object as? ProductStackView else { return }
            productView.adminMode()
            self.addArrangedSubview(productView)
        }
    }
}
