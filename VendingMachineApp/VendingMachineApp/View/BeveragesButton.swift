//
//  BeveragesButton.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/02.
//

import Foundation
import UIKit

protocol BeverageIncreasable {
    func increase(action : ((Beverage) -> Void)?)
}

//protocol testable {}
//extension testable {
//    func increase() -> testable {
//        return self
//    }
//}

//protocol testclassalbe {
//    func increase() -> testclass
//}
//
//protocol testable2 {
//    func increase() -> Beverage?
//}

class BeveragesButton : UIButton {
    func increase(action: ((Beverage) -> Void)?) { return }
}


//class testclass {
//    func increase(action : ((Beverage)->Void)?) {}
//}
//
//class testclass1 : testclass {
//    override func increase(action: ((Beverage) -> Void)?) {
//        action?(TopAmericano())
//    }
//}
