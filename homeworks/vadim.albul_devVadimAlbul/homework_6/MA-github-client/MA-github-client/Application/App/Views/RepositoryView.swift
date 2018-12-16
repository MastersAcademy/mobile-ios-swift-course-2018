import UIKit

protocol RepositoryViewDelegate: AnyObject {
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
    weak var delegate: RepositoryViewDelegate?

    // MARK: IBAction
    @IBAction func touchContent(_ sender: UIControl) {
        delegate?.selectReposiory(with: identifier, in: self)
    }
}

extension RepositoryView {
    
    func setContent(repo: ReposytoryPresentation) {
        lblTitle.text = repo.name
        lblSubtitle.text = repo.subtitle
        lblDescription.text = repo.description
        lblLanguege.text = repo.language
        identifier = repo.identifier
    }
}
