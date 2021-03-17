import UIKit

class AddBeverageButton: UIButton {
    
    var beverageType: Beverage.Type!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configrueButton()
    }
    
    init(frame: CGRect, type: Beverage.Type) {
        super.init(frame: frame)
        beverageType = type
        configrueButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configrueButton()
    }
    
    private func configrueButton() {
        setTitle("재고추가", for: .normal)
        setTitleColor(.systemBlue, for: .normal)
        backgroundColor = UIColor.systemYellow
        addTarget(superview, action: #selector(AdminViewController.addBeverageStock(_:)), for: .touchUpInside)
    }
}
