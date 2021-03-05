//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/02.
//

import UIKit

protocol BeverageFactory {
    func makebananaMilk(_ manufactured: Date) -> Milk
    func makeStrawBerryMilk(_ manufactured: Date) -> Milk
    func makeCider(_ manufactured: Date) -> Cider
    func makeCoke(_ manufactured: Date) -> Coke
}
