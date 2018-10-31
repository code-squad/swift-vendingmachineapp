//
//  DataManageError.swift
//  VendingMachineApp
//
//  Created by 이동건 on 31/10/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import Foundation

enum DataManageError: Error, CustomStringConvertible {
    var description: String {
        switch self {
        case .failToSave:
            return "데이터 저장에 실패하였기 때문에 새 음료를 채워넣었습니다."
        case .failToLoad:
            return "데이터를 불러오는데 실패하였기 때문에 새 음료를 채워넣었습니다."
        }
    }
    
    case failToSave
    case failToLoad
}
