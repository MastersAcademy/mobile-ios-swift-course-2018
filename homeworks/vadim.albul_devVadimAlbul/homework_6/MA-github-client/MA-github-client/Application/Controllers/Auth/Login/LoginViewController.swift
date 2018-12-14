import UIKit

class LoginViewController: BasicViewController {

    // MARK: IBOutlet
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnSingIn: UIButton!
    
    // MARK: life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: update UI
    override func updateUIWithPresentation() {
        guard let loginPresentation = presentation as? LoginPresentation else { return }
        tfEmail.text = loginPresentation.email
        tfPassword.text = loginPresentation.password
    }
    
    @IBAction func touchSingIn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "TabBar", bundle: Bundle.main)
        if let tabBarVC = storyboard.instantiateInitialViewController() {
            self.present(tabBarVC, animated: true, completion: nil)
        }
    }
}
