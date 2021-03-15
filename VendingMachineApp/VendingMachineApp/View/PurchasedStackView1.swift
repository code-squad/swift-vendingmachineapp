import Foundation
import UIKit

class PurchasedStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configureStackView()
    }
    
    func configureStackView() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = -70
    }
}
