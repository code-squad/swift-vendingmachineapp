////
////  PossibleStateSet.swift
////  VendingMachine
////
////  Created by hw on 18/07/2019.
////  Copyright © 2019 JK. All rights reserved.
////
//
//import Foundation
//
//class PossibleStateSet{
//    var vendingMachine: VendingMachine
//
//    /// mode select
//    private (set) var modeSelectState: StateTransitionable
//    /// user mode state
//    private (set) var initialState: StateTransitionable
//    private (set) var readyState : StateTransitionable
//    private (set) var chargeMoneyState: StateTransitionable
//    private (set) var sellingState: StateTransitionable
//    /// admin mode state
//    private (set) var adminInitialState : StateTransitionable
//    private (set) var adminReadyState : StateTransitionable
//    private (set) var addStockState : StateTransitionable
//    private (set) var removeStockState : StateTransitionable
//
//    init (machine: VendingMachine){
//        vendingMachine = machine
//        modeSelectState = ModeSelectState.init(machine: machine)
//        initialState = InitialState(machine: machine)
//        readyState = ReadyState.init(machine: machine)
//        chargeMoneyState = ChargingMoneyState(machine: machine)
//        sellingState = SellingState(machine: machine)
//        adminInitialState = AdminInitialState.init(machine: machine)
//        adminReadyState = AdminReadyState.init(machine: machine)
//        addStockState = AddStockState.init(machine: machine)
//        removeStockState = RemoveStockState.init(machine: machine)
//    }
//
//    func selectState(type: StateType) -> StateTransitionable{
//        switch type{
//        case .modeSelect:
//            return modeSelectState
//        case .initialize:
//            return initialState
//        case .ready:
//            return readyState
//        case .chargeMoney:
//            return chargeMoneyState
//        case .sell:
//            return sellingState
//        case .addStock:
//            return addStockState
//        case .removeStock:
//            return removeStockState
//        case .adminInitialize:
//            return adminInitialState
//        case .adminReady:
//            return adminReadyState
//        }
//    }
//}
