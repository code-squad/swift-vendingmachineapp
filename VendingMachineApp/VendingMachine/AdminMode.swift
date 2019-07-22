////
////  AdminMode.swift
////  VendingMachine
////
////  Created by hw on 15/07/2019.
////  Copyright © 2019 JK. All rights reserved.
////
//
//import Foundation
//
//class AdminMode{
//    private var vendingMachine : VendingMachine
//    init(machine: VendingMachine){
//        self.vendingMachine = machine
//    }
//    
//    func play(){
//        while true {
//            if vendingMachine.vendingMachineState! is AdminInitialState {
//                printAdminInitialStateMessage(vendingMachine)
//                vendingMachine.vendingMachineState!.implementStateInstruction()
//                continue
//            }
//            if vendingMachine.vendingMachineState! is AdminReadyState {
//                if handleReadyState(vendingMachine) {
//                    vendingMachine.vendingMachineState!.implementStateInstruction()
//                }
//                continue
//            }
//            if vendingMachine.vendingMachineState! is ModeSelectState{
//                return
//            }
//            /// common
//            let resultPair = vendingMachine.vendingMachineState!.implementStateInstruction()
//            guard let printMessage = resultPair.success else {
//                handleError(resultPair.failure)
//                continue
//            }
//            if vendingMachine.fromState == .addStock {
//                printAddStockStateMessage(message: printMessage)
//            }
//            if vendingMachine.fromState == .removeStock{
//                printRemoveStockStateMessage(message: printMessage)
//            }
//        }
//    }
//    
//    private func readDrinkNumberQuantity() throws -> (instruction: Int, quantity: Int) {
//        AdminOutputView.printDrinkNumberQuantity()
//        let pair = try InputView.readInstruction()
//        return pair
//    }
//    
//    private func handleReadyState(_ vendingMachine: VendingMachine) -> Bool{
//        var instruction: Int!
//        do {
//            printAdminReadyStateMessage(vendingMachine)
//            instruction = try AdminInputView.readAdminInstruction()
//            let currentState = vendingMachine.vendingMachineState! as! AdminReadyState
//            currentState.receiveInstruction(instruction: instruction)
//            if StateType.init(value: instruction) != .modeSelect {
//                let pair = try readDrinkNumberQuantity()
//                currentState.receiveDrinkStcokInstruction(number: pair.instruction, quantity: pair.quantity)
//            }
//            return true
//        }catch(let errorType as VendingMachineError) {
//            CommonOutputView.printErrorMessage(errorType)
//            return false
//        }catch {
//            CommonOutputView.printErrorMessage(.unknownError)
//            return false
//        }
//    }
//    
//    private func handleError(_ error: VendingMachineError?){
//        guard let errorMessage = error else {
//            CommonOutputView.printErrorMessage(VendingMachineError.unknownError)
//            return
//        }
//        CommonOutputView.printErrorMessage(errorMessage)
//    }
//    
//    private func printAdminInitialStateMessage(_ vendingMachine: VendingMachine){
//        AdminOutputView.showCurrentEarningInfo(vendingMachine)
//        CommonOutputView.printInitialDrinkMenuList(vendingMachine)
//    }
//    
//    private func printAdminReadyStateMessage(_ vendingMachine: VendingMachine){
//        AdminOutputView.showCurrentEarningInfo(vendingMachine)
//        CommonOutputView.printDrinkMenuListWithNumber(vendingMachine)
//        print()
//        AdminOutputView.selectAdminMenuInfo()
//    }
//    
//    private func printAddStockStateMessage( message: String){
//        let addStockInfo = message.components(separatedBy: ",")
//        AdminOutputView.printAddStockMessage(name: addStockInfo[0], count: addStockInfo[1])
//    }
//    
//    private func printRemoveStockStateMessage( message: String){
//        let removeStockInfo = message.components(separatedBy: ",")
//        AdminOutputView.printRemoveStockMessage(name: removeStockInfo[0], count: removeStockInfo[1])
//    }
//}
