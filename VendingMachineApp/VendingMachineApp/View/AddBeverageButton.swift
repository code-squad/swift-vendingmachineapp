import UIKit

class AddBeverageButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 100, y: 30, width: 80, height: 40))
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
