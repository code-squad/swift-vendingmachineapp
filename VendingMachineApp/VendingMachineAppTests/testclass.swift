//
//  testclass.swift
//  VendingMachineAppTests
//
//  Created by 박정하 on 2021/03/06.
//

import Foundation

class testClass{
    let beverageList : [Beverage] = [BeverageCreater().makeCider(Date().stringTodate("20200303")),
                                     BeverageCreater().makeCoke(Date().stringTodate("20200301")),
                                     BeverageCreater().makebananaMilk(Date().stringTodate("20200302")),
                                     BeverageCreater().makeStrawBerryMilk(Date().stringTodate("20200301")),
                                     BeverageCreater().makeHOT6(Date().stringTodate("20210226")),
                                     BeverageCreater().makeMonster(Date().stringTodate("20200226")),
                                     BeverageCreater().makeCaffeMocha(Date().stringTodate("20200226")),
                                     BeverageCreater().makeCaffeLatte(Date().stringTodate("20200227"))]
}
