//
//  PurchasedView.swift
//  VendingMachineApp
//
//  Created by yuaming on 22/03/2018.
//  Copyright © 2018 CodeSquad. All rights reserved.
//

import Foundation
import UIKit

class SalesHistoryView {
    private var beveragesImageViews: [RoundImageView] = [RoundImageView]()
    
    func makeImageView(_ beverage: String) -> Int {
        let imageName = beverage.components(separatedBy: ",")[1].trimmingCharacters(in: .whitespaces)
        let image = UIImage(named: "\(imageName).jpg")
        let imageView = RoundImageView(image: image, position: CGFloat(count))
        beveragesImageViews.append(imageView)
        return count-1
    }
    
    var count: Int {
        return beveragesImageViews.count
    }
    
    subscript(index: Int) -> RoundImageView {
        return beveragesImageViews[index]
    }
}
