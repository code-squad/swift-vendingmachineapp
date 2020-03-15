//
//  StrawberryMilkButton.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/16.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

final class StrawberryMilkButton: BeverageButton {
    override func invokeAction(sender: BeverageButton) {
        action?(StrawberryMilk())
    }
}
