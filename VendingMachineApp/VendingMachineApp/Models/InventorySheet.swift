//
//  InventorySheet.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/14.
//

import UIKit

protocol InventoryTakeable {
    func showInventorySheet(handler: (Dictionary<Slot, Int>.Element) -> ())
}

struct InventorySheet {
    func createInventoryViewInfo(for vendingMachine: InventoryTakeable) -> [Slot: SlotView] {
        var inventoryViewInfo: [Slot: SlotView] = [ : ]
        vendingMachine.showInventorySheet {
            inventoryViewInfo[$0.key] = makeSlotView(with: $0.key)
        }
        return inventoryViewInfo
    }
    
    private func makeSlotView(with slot: Slot) -> SlotView {
        let view = SlotView()
        view.itemImageView.image = UIImage(named: slot.getPackagingInfo() ?? "")
        view.itemQuantityLabel.text = "\(slot.itemCount)개"
        return view
    }
}
