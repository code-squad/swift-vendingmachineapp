//
//  CoffeeBean.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum CoffeeBean: String, Codable{
    case arabica
    case ethiopia
    case kenya
    case brazil
    
    init(from decoder: Decoder) throws {
        let beanType = try decoder.singleValueContainer().decode(String.self)
        self = CoffeeBean(rawValue: beanType) ?? .arabica
    }
    
    var description: String {
        switch self {
        case .arabica:
            return "아라비카원두"
        case .ethiopia:
            return "에티오피아산"
        case .kenya:
            return "케냐산"
        case .brazil:
            return "브라질산"
        }
    }
}
