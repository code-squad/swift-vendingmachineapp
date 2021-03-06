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
    func makeHOT6(_ manufactured: Date) -> Hot6
    func makeMonster(_ manufactured : Date) -> Monster
    func makeCaffeMocha(_ manufactured : Date) -> CaffeMocha
    func makeCaffeLatte(_ manufactured : Date) -> CaffeeLatte
}
