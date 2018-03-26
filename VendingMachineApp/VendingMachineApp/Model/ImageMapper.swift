//
//  ImageMapper.swift
//  VendingMachineApp
//
//  Created by Eunjin Kim on 2018. 3. 22..
//  Copyright © 2018년 Eunjin Kim. All rights reserved.
//

import Foundation

protocol ImageMapper {
    var bringImageName: String { get }
}

extension ImageMapper {
    var bringImageName: String {
        let name = String(describing: type(of: self))
        let result = name + ".jpg"
        return result
    }
}
