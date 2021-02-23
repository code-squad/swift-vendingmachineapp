//
//  DrinkProtocol.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation


protocol DrinkProtocol : CustomStringConvertible{
    var brand : String {get }
    var volume : Int {get }
    var charge : Int {get }
    var name : String {get }
    var manufacturingDate : Date {get }
}
