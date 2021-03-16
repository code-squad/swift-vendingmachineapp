import UIKit

class AdminViewController: UIViewController {
    
    private var beverageStackView: AdminBeverageStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beverageStackView = AdminBeverageStackView()
        configureBeverageStackView()
    }
    
    @IBAction func closeButtonTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension AdminViewController {
    
    private func configureBeverageStackView() {
        view.addSubview(beverageStackView)
        beverageStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        beverageStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    }
}
