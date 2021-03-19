//
//  ControllerViewModel.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/19.
//

import UIKit

protocol ButtonViewModel {
    typealias ControlActionClosure = (UIButton, Int) -> ()
    func bind(control action: @escaping ControlActionClosure)
}
