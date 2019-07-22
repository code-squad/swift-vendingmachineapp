////
////  UserMode.swift
////  VendingMachine
////
////  Created by hw on 15/07/2019.
////  Copyright © 2019 JK. All rights reserved.
////
//
//import Foundation
//
//class UserMode{
//    private var vendingMachine : VendingMachine
//    init(machine: VendingMachine){
//        self.vendingMachine = machine
//    }
//    
//    func play(){
//        while true {
//            if vendingMachine.vendingMachineState! is InitialState {
//                printInitialStateMessage(vendingMachine)
//                vendingMachine.vendingMachineState!.implementStateInstruction()
//                continue
//            }
//            if vendingMachine.vendingMachineState! is ReadyState {
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
//            guard let printMessage = resultPair.success  else {
//                handleError(resultPair.failure)
//                continue
//            }
//            /// if selling
//            printSellingStateMessage(vendingMachine, message: printMessage)
//        }
//    }
//    
//    private func handleReadyState(_ vendingMachine: VendingMachine) -> Bool{
//        var pair: (instruction: Int, quantity: Int)!
//        do {
//            printReadyStateMessage(vendingMachine)
//            pair = try InputView.readInstruction()
//            let currentState = vendingMachine.vendingMachineState! as! ReadyState
//            currentState.receiveInstruction(instruction: pair.instruction, quantity: pair.quantity)
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
//    
//    private func printInitialStateMessage(_ vendingMachine: VendingMachine){
//        UserOutputView.showCurrentBalanceInfo(vendingMachine)
//        CommonOutputView.printInitialDrinkMenuList(vendingMachine)
//    }
//    
//    private func printReadyStateMessage(_ vendingMachine: VendingMachine){
//        UserOutputView.showCurrentBalanceInfo(vendingMachine)
//        CommonOutputView.printDrinkMenuListWithNumber(vendingMachine)
//        UserOutputView.selectMenuInfo()
//    }
//    
//    private func printSellingStateMessage(_ vendingMachine: VendingMachine, message: String){
//        if vendingMachine.vendingMachineState! is SellingState {
//            let sellingInfo = message.components(separatedBy: ",")
//            UserOutputView.printSellingMessage(name: sellingInfo[0], price: sellingInfo[1])
//        }
//    }
//}
