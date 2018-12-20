import UIKit

protocol RepositoryViewDelegate: AnyObject {
    func didSelectRepositoryView(_ view: RepositoryView, with identifier: String)
}

class RepositoryView: ViewFromXib {

    // MARK: IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblLanguege: UILabel!
    
    // MARK: property
    var identifier: String = ""
    weak var delegate: RepositoryViewDelegate?

    // MARK: IBAction
    @IBAction func touchContent(_ sender: UIControl) {
        delegate?.didSelectRepositoryView(self, with: identifier)
    }
}

extension RepositoryView {
    
    func renderContetn(with model: ReposytoryPresentation) {
        lblTitle.text = model.name
        lblSubtitle.text = model.subtitle
        lblDescription.text = model.description
        lblLanguege.text = model.language
        identifier = model.identifier
    }
}
