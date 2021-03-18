//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/17.
//

import UIKit

class AdminViewController: UIViewController {

    @IBOutlet weak var adminStackview: UIStackView!
    var sampleViewData = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        sampleViewData.forEach { (data) in
            let object = ArchivingCenter.unarchive(with: data)
            
            guard object != nil,
                  let view = object as? ProductStackView else { return }
            view.buyButton.isHidden = true
            view.addButton.isHidden = false
            adminStackview.addArrangedSubview(view)
        }
    }
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
