//
//  Controller.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 30..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Controller {

    // 관리자 모드에서 add동작을 위해 필요한 AdminController
    struct AdminController {
        let beverages = [
            BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20180213"),
            ChocoMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다초코우유", manufactured: "20180212"),
            Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010"),
            DolceLatte(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20171210"),
            EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20171010"),
            SoftDrink(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20171005")
        ]

        func addItems(_ index: Int) throws -> Beverage {
            guard 0...beverages.count-1 ~= index else {
                throw Exception.outOfStock
            }
            return self.beverages[index]
        }

        func addItemsDescription() -> String {
            var result = ""
            var index = 0
            for item in beverages {
                index += 1
                result += "\(index)) \(item.type) | "
            }
            return result
        }
    }

    func setVendingMachineStock(unit: Int) -> [Beverage] {
        var stock = [Beverage]()
        let chocoMilk = ChocoMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다초코우유", manufactured: "20180212")
        let bananaMilk = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20180213")
        let coke = SoftDrink(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20171005")
        let americano = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010")
        let dolceLatte = DolceLatte(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20171210")
        let energyDrink = EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20171010")

        for _ in 0..<unit {
            stock.append(chocoMilk)
            stock.append(bananaMilk)
            stock.append(coke)
            stock.append(americano)
            stock.append(dolceLatte)
            stock.append(energyDrink)
        }
        return stock
    }

    func vendingMachineDescription() -> String {
        let vending = VendingMachine(stockItems: self.setVendingMachineStock(unit: 3))
        return vending.showStockDefault()
    }

    /*
    func run() {
        let productSets = setVendingMachineStock(unit: 3)
        var vendingMachine = VendingMachine(stockItems: productSets)
        var runProgram = true

        while runProgram {
            switch InputView().askSelectMode(message: .chooseMode) {

            case .admin: do {
                vendingMachine = try adminMode(vendingMachine)
            } catch let error {
                switch error {
                case Exception.outOfStock:
                    OutputView().showDescription(.hasNoItem)
                default: OutputView().showDescription(.unKnown)
                }
                continue
            }

            case .user: do {
                vendingMachine = try userMode(vendingMachine)
            } catch let error {
                switch error {
                case Exception.notEnoughBalance:
                    OutputView().showDescription(Exception.notEnoughBalance.description)
                case Exception.outOfStock:
                    OutputView().showDescription(Exception.outOfStock.description)
                default: OutputView().showDescription(.unKnown)
                }
                continue
                }

            case .none:
                OutputView().showDescription(.askInputAgain)
                continue

            case .quit:
                OutputView().showDescription(.quitVendingMachine)
                runProgram = false
            }
        }

    }

    private func adminMode(_ vendingMachine: VendingMachine) throws -> VendingMachine {
        var run = true

        while run {
            let input = InputView().askAdminModeAction(message: "<< 관리자 모드 >>\n원하는 동작과 음료 번호를 선택하세요.\n\(vendingMachine.showStockDefault())\n1. 재고 추가 | 2. 재고 삭제 (띄어쓰기로 구분, 종료를 원하면 \"q\"입력) \n>>")

            switch input {
            case .addItem:
                let itemCode = InputView().askOptionNumber(message: "추가를 원하는 상품 번호를 입력하세요.\n\(AdminController().addItemsDescription())\n")
                vendingMachine.add(inputItem: try AdminController().addItems(itemCode))

            case .deleteItem:
                let itemCode = InputView().askOptionNumber(message: "삭제를 원하는 상품 번호를 입력하세요.\n\(vendingMachine.showStock())\n")
                try vendingMachine.removeItem(itemCode: itemCode)

            case .none: OutputView().showDescription(.askInputAgain)
                continue

            case .quit: OutputView().showDescription(.quitAdminMode)

            run = false
            }
        }
        return vendingMachine
    }

    // 사용자 모드
    private func userMode(_ vendingMachine: VendingMachine) throws -> VendingMachine {
        var result = Beverage()
        var input = (action: UserMenu.none, option: 0)
        var run = true

        while run {
            let flag = vendingMachine.hasMiminumBalance()

            // 자판기의 Balance 금액에 따라 사용자에게 보여지는 메뉴 텍스트가 다름
            switch flag {
            case false:
                input = InputView().askUserExecuteOption(message: "현재 투입한 금액이 \(vendingMachine.showBalance())원입니다. 다음과 같은 음료가 있습니다. \n\(vendingMachine.showStockDefault()) \n1. 금액추가 \n2. 음료구매 (종료를 원하면 \"q\"입력)\n>>")

            case true:
                input = InputView().askUserExecuteOption(message: "================================\n현재 투입한 금액이 \(vendingMachine.showBalance())원입니다. 다음과 같은 음료가 있습니다.\n \n\(vendingMachine.showStock()) \n1. 금액추가 \n2. 음료구매 (종료를 원하면 \"q\"입력)\n>>")
            }

            let operationType = input.action

            switch operationType {
            case .addBalance: vendingMachine.addBalance(money: input.option)

            case .buyItem: result = try vendingMachine.buy(itemCode: input.option)
                print("\n>>\(result.type)을 선택하셨습니다. \(result.price())원을 차감합니다.")

            case .none:
                OutputView().showDescription(.askInputAgain)
                continue

            case .quit:
                OutputView().showDescription(.quitUserMode)
                run = false
            }
        }
        return vendingMachine
    }
*/
}
