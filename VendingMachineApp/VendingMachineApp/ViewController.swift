//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by jinseo park on 3/17/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let milk = Milk("서울우유", 2, 1300, "맛있는", .Banana, "2021-02-02")
        let soda = Soda("펩시", 1, 1500, "다이어트", .Coke, "2021-03-15")
        let coffee = Coffee("TOP", 5, 2500, "김연아", .Macchiato, "2021-02-24")
        print(milk)
        print(soda)
        print(coffee)
        
        
    }


}

