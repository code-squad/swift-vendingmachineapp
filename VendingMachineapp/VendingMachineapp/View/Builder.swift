//
//  Builder.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/09.
//

import Foundation
import UIKit
protocol Builder {
    associatedtype item
    var product: item {get}
    func setText(name: String) -> Self
}

class ConcreteBuilderButton: Builder {
    var product = UIButton()
    
    func setText(name: String) -> Self {
        self.product.setTitle(name, for: .normal)
        self.product.setTitleColor(.blue, for: .normal)
        return self
    }
}

class ConcreteBuilderLabel: Builder {
    var product = UILabel()
    
    func setText(name: String) -> Self {
        self.product.text = "0"
        return self
    }
}

class Director {
    static func makeProduct<T: Builder>(builder: T) -> T.item{
        let build = builder
        build.setText(name: "추가")
        return build.product
    }
}
