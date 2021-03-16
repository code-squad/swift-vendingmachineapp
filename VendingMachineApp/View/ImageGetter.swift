//
//  ImageGetter.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/16.
//

import UIKit

class ImageManager {
    static private let images : [UIImage?] = [UIImage(named: "top"),UIImage(named: "georgia"),UIImage(named: "cantata"),
                                       UIImage(named: "stroberry"), UIImage(named: "chocolate"),UIImage(named: "banana"),
                                       UIImage(named: "monsterOriginal"),
                                       UIImage(named: "hot6ixBlue"),UIImage(named: "hot6ixRed")]
                                    //  UIImage(named: "sprite"),UIImage(named: "coke")
    
    static private let typeArr : [Beverage.Type] = [ Top.self, Georgia.self, Cantata.self,
                                              StroberryMilk.self, ChocolateMilk.self, BananaMilk.self,
                                              Monster.self, Hot6ix.self]
                                        // Sprite.self, Coke.self
    static func getImage(type : Beverage.Type) -> UIImage {
        guard let index = ImageManager.typeArr.firstIndex(where: {$0 == type.self }) else { return UIImage() }
        return images[index] ?? UIImage()
    }
}

