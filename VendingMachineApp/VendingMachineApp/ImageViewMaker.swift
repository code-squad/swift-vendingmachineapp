//
//  ImageViewMaker.swift
//  VendingMachineApp
//
//  Created by 권재욱 on 2018. 3. 14..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation
import UIKit

struct ImageViewMaker {
    private var baseX : Int = 70
    
    mutating func generateImageViewOfPurchase(_ list : [Beverage]) -> [UIImageView] {
        var imageViewBox : [UIImageView] = []
        for oneProduct in list {
            let productImg = UIImage(named : getImgSource(ObjectIdentifier(type(of : oneProduct)))) ?? UIImage()
            let imageView = UIImageView(image : productImg)
            imageView.frame = CGRect(x: self.baseX, y: 650, width: 150, height: 150)
            imageViewBox.append(imageView)
            self.baseX += 80
        }
        self.baseX = 70
        return imageViewBox
    }
    
    private func getImgSource(_ productKind : ObjectIdentifier) -> String {
        switch productKind {
        case StrawberryMilk.getKind(): return Keyword.Img.strawberryMilk.rawValue
        case BananaMilk.getKind(): return Keyword.Img.bananaMilk.rawValue
        case PepciCoke.getKind(): return Keyword.Img.pepciCoke.rawValue
        case Fanta.getKind(): return Keyword.Img.fanta.rawValue
        case TOPCoffee.getKind(): return Keyword.Img.topCoffee.rawValue
        case Georgia.getKind(): return Keyword.Img.georgia.rawValue
        default: return ""
        }
    }
}
