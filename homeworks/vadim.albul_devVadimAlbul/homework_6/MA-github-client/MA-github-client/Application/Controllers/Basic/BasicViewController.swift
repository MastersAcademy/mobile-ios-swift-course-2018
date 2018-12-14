import UIKit.UIViewController


class BasicViewController: UIViewController {
    
    // MARK: property
    var presentation: BasicPresentation? {
        willSet {
            loadViewIfNeeded()
        }
        didSet {
            updateUIWithPresentation()
        }
    }
    
    // MARK: life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: update UI
    func updateUIWithPresentation() {
        
    }
}
