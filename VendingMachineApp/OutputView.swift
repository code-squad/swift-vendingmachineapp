//
//  OutputView.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 15/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

struct OutputView {
    static func printStock(of machine: PrintableMachingState) {
        machine.machineStateInManagerMode { stock in
            print(stock.currentStockState())
        }
    }
}
