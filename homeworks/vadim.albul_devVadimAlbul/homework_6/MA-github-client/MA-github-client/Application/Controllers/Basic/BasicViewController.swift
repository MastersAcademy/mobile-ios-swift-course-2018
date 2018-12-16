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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationItems()
    }
    
    // MARK: set navigtion item
    func setNavigationItems() {
        setCustomBackButton()
    }
    
    func setCustomBackButton() {
        self.navigationItem.hidesBackButton = true
        if let navigationController = navigationController, navigationController.viewControllers.count > 1 {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: self, action: #selector(actionBackButton))
        }
    }
    
    // MARK: update UI
    func updateUIWithPresentation() {
        
    }
    
    // MARK: target action
    @objc func actionBackButton() {
        closeAlertVC {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func closeAlertVC(_ completion: @escaping () -> Void) {
        let alert = UIAlertController(title: "Are you sure you want to go back?", message: nil, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            completion()
        }
        alert.addAction(yesAction)
        
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(noAction)
        self.present(alert, animated: true, completion: nil)
    }
}
