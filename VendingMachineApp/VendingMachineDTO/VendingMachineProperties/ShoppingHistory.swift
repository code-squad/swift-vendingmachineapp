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

class ShoppingHistory: Codable, Drawable{

    
    private var drinkList : [Drink]
    private var imageInfoList : [ImageInfo]
    var count : Int{
        get{
            return drinkList.count
        }
    }
    var list : [Drink]{
        return drinkList
    }
    var totalCount: Int {
        return calculateTotalCount()
    }
    var historySet: [String: Int] {
        var historySet = [String: Int]()
        for drink in drinkList {
            guard let value = historySet[drink.name] else{
                historySet.updateValue(1, forKey: drink.name)
                continue
            }
            historySet.updateValue(value+1, forKey: drink.name)
        }
        return historySet
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
    
    func drawData(_ format: (_ dataSet: [String : Int], _ optionValue: Int ) -> Void) {
        format(historySet, totalCount)
    }
    
    func setColors(_ format: ([String : Int]) -> Void) {
        format(historySet)
    }
    
    func showTotalCount (_ format: (Int) -> Void){
        format(totalCount)
    }
    private func calculateTotalCount() -> Int{
        let temporalMap = historySet.map{ (key: String, value: Int) ->
            Int in return value }
        let totalCount = temporalMap.reduce(0, {(value1: Int, value2: Int) ->
            Int in return value1+value2})
        return totalCount
    }
    
    
}
