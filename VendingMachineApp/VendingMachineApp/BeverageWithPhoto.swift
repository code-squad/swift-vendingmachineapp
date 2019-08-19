//
//  BeverageWithPhoto.swift
//  VendingMachineApp
//
//  Created by 김성현 on 12/08/2019.
//  Copyright © 2019 김성현. All rights reserved.
//

import UIKit

class BeverageWithPhoto: Beverage {
    
    var photo: UIImage?
    
    private enum CodingKeys: CodingKey {
        case photo
    }
    
    init(name: String, price: Coin, photo: UIImage?, brand: String, packageSize: Int, beverageTemperature: Int, expirationPeriod: TimeInterval) {
        self.photo = photo
        super.init(name: name, price: price, brand: brand, packageSize: packageSize, beverageTemperature: beverageTemperature, expirationPeriod: expirationPeriod)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let photoData = try container.decode(Data.self, forKey: .photo)
        self.photo = UIImage(data: photoData)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        let photoData = photo?.jpegData(compressionQuality: 1)
        try container.encode(photoData, forKey: .photo)
    }
}
