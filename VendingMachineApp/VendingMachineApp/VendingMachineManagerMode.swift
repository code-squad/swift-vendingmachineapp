////
////  VendingMachineManagerMode.swift
////  VendingMachine
////
////  Created by 조재흥 on 18. 12. 27..
////  Copyright © 2018 JK. All rights reserved.
////
//
//import Foundation
//
//struct VendingMachineManagerMode {
//    static func run(_ vendingMachineOfManagerMode: VendingMachineManagerFunction) -> VendingMachine? {
//        var vendingMachine = vendingMachineOfManagerMode
//        while true {
//            let addableList = AddableBeverage.allCases
//            let inputMent = MentMaker.makeManagerInputMent(addableList: addableList)
//            let inputString = InputView.readInput(ment: inputMent)
//            if VendingMachineMode.back.isEqual(input: inputString) {
//                guard let vendingMachine = vendingMachine as? VendingMachine else {return nil}
//                return vendingMachine
//            }
//            guard ValidChecker.checkManagerInput(string: inputString, countOfBeverage: addableList.count)
//                else {return nil}
//            let input = VendingMachineInput(input: inputString)
//
//            if input.isModeEqual(1) {
//                guard let addableProduct = input.readBeverage(addableList: addableList) else {return nil}
//                let product = BeverageFactory.produce(addableBeverage: addableProduct)
//                vendingMachine.add(product: product)
//            }
//
//            if input.isModeEqual(2) {
//                vendingMachine.removeExpiredProducts()
//                OutputView.show(result: "유통기한이 지난 음료들을 제거하였습니다.\n")
//            }
//        }
//    }
//}
