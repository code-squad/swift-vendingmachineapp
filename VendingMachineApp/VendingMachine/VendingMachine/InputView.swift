//
//  InputView.swift
//  VendingMachine
//
//  Created by 김지나 on 29/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    // 메뉴를 선택하도록 입력 받기
    func selectMenu() -> String {
        guard let select = readLine() else { return "" }
        return select
    }
}
