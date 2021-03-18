//
//  VendingMachineUpdator.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import UIKit

protocol VendingMachineViewPresenter {
    
    func initialScreen(images: [UIImage], sampleView: ProductStackView, stackView: UIStackView, moneyLabel: UILabel)
    
    func updateStocks(countLabels: [UILabel], typeList: [Shopable.Type])
    
    func updateBalance(label: UILabel)
    
    func updateDispensedList(scrollView: UIScrollView, images: [UIImage], typeList: [Shopable.Type])
    
    func addItemToDispensedList(scrollView: UIScrollView, images: [UIImage], typeList: [Shopable.Type])
}

class VendingMachineViewUpdator: VendingMachineViewPresenter {
    
    private let userInterface: UserInterface
    private let workerInterface: WorkerInterface
    
    init(userInterface: UserInterface, workerInterface: WorkerInterface) {
        self.userInterface = userInterface
        self.workerInterface = workerInterface
    }
    
    func initialScreen(images: [UIImage], sampleView: ProductStackView, stackView: UIStackView, moneyLabel: UILabel) {
        newProductViews(with: images, sampleView: sampleView, stackView: stackView)
        updateBalance(label: moneyLabel)
    }
    
    private func newProductViews(with images: [UIImage], sampleView: ProductStackView, stackView: UIStackView) {
        
        stackView.arrangedSubviews.forEach { (sample) in
            sample.removeFromSuperview()
        }
    
        for image in images {
            let newView = productView(with: image, sampleView)
            stackView.addArrangedSubview(newView)
        }
    }
    
    private func productView(with image: UIImage,_ sampleView: ProductStackView) -> ProductStackView {
        
        let view = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(NSKeyedArchiver.archivedData(withRootObject: sampleView, requiringSecureCoding: false)) as! ProductStackView
        
        view.imageView.image = image
        view.addButton.isHidden = true

        return view
    }
    
    func updateStocks(countLabels: [UILabel], typeList: [Shopable.Type]) {
        let stockList = workerInterface.allStocks()
        
        for (idx, beverage) in typeList.enumerated() {
            let id = ObjectIdentifier(beverage)
            if let count = stockList[id] {
                countLabels[idx].text = "\(count)개"
            } else {
                countLabels[idx].text = "품절"
            }
        }
    }
    
    func updateBalance(label: UILabel) {
        label.text = "\(userInterface.moneyLeft())원"
    }
    
    func updateDispensedList(scrollView: UIScrollView, images: [UIImage], typeList: [Shopable.Type]) {
    
        let sizeUnit: CGFloat = scrollView.bounds.height * 0.7
        scrollView.contentSize.width = sizeUnit/2
        
        let purchased = workerInterface.purchased()
        let count = purchased.count
        
        guard count > 0 else { return }

        for i in 1...count {
            if let image = productImage(for: purchased[count-i], typeList, images) {
                addImageView(xPosition: CGFloat(count-i) * sizeUnit/2, sizeUnit: sizeUnit, scrollView: scrollView, image: image)
            }
        }
    }
    
    func addItemToDispensedList(scrollView: UIScrollView, images: [UIImage], typeList: [Shopable.Type]) {
        
        let itemToUpdate = workerInterface.purchased().last ?? Beverage()
        let sizeUnit: CGFloat = scrollView.bounds.height * 0.7

        scrollView.subviews.forEach { (view) in
            view.frame = view.frame.offsetBy(dx: sizeUnit/2, dy: 0)
        }
        
        if let image = productImage(for: itemToUpdate, typeList, images) {
            addImageView(xPosition: 0, sizeUnit: sizeUnit, scrollView: scrollView, image: image)
        }
    }
    
    private func productImage(for item: Shopable,_ typeList: [Shopable.Type],_ images: [UIImage]) -> UIImage? {
        if let targetIdx = typeList.firstIndex(where: { (listItem) -> Bool in
            ObjectIdentifier(listItem) == ObjectIdentifier(type(of: item))
        }) {
            return images[targetIdx]
        } else {
            return nil
        }
    }
    
    private func addImageView(xPosition: CGFloat, sizeUnit: CGFloat, scrollView: UIScrollView, image: UIImage) {
        let yPosition = scrollView.bounds.height/2 - sizeUnit/2
        let newView = UIImageView(frame: CGRect(x: xPosition,
                                                y: yPosition,
                                                width: sizeUnit,
                                                height: sizeUnit))
        newView.image = image
        newView.contentMode = .scaleAspectFit
        scrollView.addSubview(newView)
        scrollView.contentSize.width += sizeUnit/2
    }
}
