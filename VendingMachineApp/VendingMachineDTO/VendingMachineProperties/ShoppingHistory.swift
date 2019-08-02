//
//  ShoppingHistory.swift
//  VendingMachineApp
//
//  Created by hw on 02/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

class ImageInfo: Codable{
    var x: Double
    var y: Double
    var width: Double
    var height: Double
    var imageName: String
    init(x: Double, y: Double, width: Double, height: Double, imageName: String){
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.imageName = imageName
    }
}

class ShoppingHistory: Codable{
    private var drinkList : [Drink]
    private var imageInfoList : [ImageInfo]
    var count : Int{
        get{
            return drinkList.count
        }
    }
    var images: [ImageInfo]{
        return imageInfoList
    }
    init(){
        drinkList = [Drink]()
        imageInfoList = [ImageInfo]()
    }
    func addDrinkHistory(_ drink: Drink){
        drinkList.append(drink)
    }
    func addSubImageView(_ imageInfo: ImageInfo){
        imageInfoList.append(imageInfo)
    }
    
}
