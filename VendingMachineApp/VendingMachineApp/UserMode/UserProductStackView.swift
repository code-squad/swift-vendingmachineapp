//
//  UserProductStackView.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/19.
//

import UIKit

class UserProductStackView: UIStackView {

    @IBOutlet weak var sampleView: ProductStackView!
    
    func configure(with beverageImages: [UIImage]) {
        let data = ArchivingCenter.archive(with: sampleView as Any)
        
        self.arrangedSubviews.forEach { (sample) in
            sample.removeFromSuperview()
        }
    
        for image in beverageImages {
            if let newView = productView(with: image, data) {
                self.addArrangedSubview(newView)
            }
        }
    }
    
    private func productView(with image: UIImage,_ data: Data) -> ProductStackView? {
        
        guard let productView = ArchivingCenter.unarchive(with: data) as? ProductStackView else { return nil }
        
        productView.imageView.image = image
        productView.userMode()
        
        return productView
    }
}
