//
//  ViewController.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    let imageArray = [
        "top", "cantata", "georgia",
        "coke", "sprite", "fanta",
        "strawberry", "banana", "choco"
    ]
    
    @IBOutlet var mainStackView: UIStackView!
    @IBOutlet var lineStackView: [UIStackView]!
    @IBOutlet var beverageStackView: [UIStackView]!
    
    @IBOutlet weak var informationStackView: UIStackView!
    @IBOutlet weak var addThousandButton: UIButton!
    @IBOutlet weak var addFiveThousandButton: UIButton!

    @IBOutlet weak var currentChangeLabel: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet var labels: [UILabel]!
    
    var vendingMachine = VendingMachine(money: 1000)
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStackView.backgroundColor = .systemGray2
        setImageViews()
        setButtons()
        
        let productList = vendingMachine.initializeProductList()
        print(productList)
    }
    
    @IBAction func addButtonTouched(_ sender: UIButton) {
        
    }
    func setImageViews() {
        var index = 0
        for img in imageViews {
            img.image = UIImage(named: "\(imageArray[index])")
            index += 1
        }
    }
    
    func setButtons() {
        for button in buttons {
            button.setTitle("추가", for: .normal)
        }
    }

}
