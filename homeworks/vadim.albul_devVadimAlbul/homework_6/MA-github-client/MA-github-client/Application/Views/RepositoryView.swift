import UIKit

protocol RepositoryDelegate: AnyObject {
    func selectReposiory(with identifier: String, in view: RepositoryView)
}

class RepositoryView: ViewFromXib {

    // MARK: IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblLanguege: UILabel!
    
    // MARK: property
    var identifier: String = ""
    weak var delegate: RepositoryDelegate?

    // MARK: IBAction
    @IBAction func touchContent(_ sender: UIControl) {
        delegate?.selectReposiory(with: identifier, in: self)
    }
}
