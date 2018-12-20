import UIKit

class RepositoriesViewController: BasicViewController {

    // MARK: IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentStackView: UIStackView!
    
    // MARK: property
    private var repositories: RepositoriesPresentation? {
        get {
            return presentation as? RepositoriesPresentation
        }
        set {
            presentation = newValue
        }
    }
    
    // MARK: life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContent()
    }
    
    // MARK: setup functions
    func setupContent() {
        presentation = RepositoriesPresentation.default
    }
    
    // MARK: update UI
    override func updateUIWithPresentation() {
        contentStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        repositories.map { (repo) in
            repo.items.forEach { (repository) in
                let repoView = RepositoryView()
                repoView.renderContetn(with: repository)
                repoView.delegate = self
                contentStackView.addArrangedSubview(repoView)
            }
        }
        view.layoutIfNeeded()
    }
}

// MARK: - extension: RepositoryViewDelegate
extension RepositoriesViewController: RepositoryViewDelegate {
    
    func didSelectRepositoryView(_ view: RepositoryView, with identifier: String) {
        guard let repo = repositories?.items.first(where: {$0.identifier == identifier}) else { return }
        let detailVC = DetailRepositoryViewController()
        detailVC.hidesBottomBarWhenPushed = true
        detailVC.presentation = repo
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
