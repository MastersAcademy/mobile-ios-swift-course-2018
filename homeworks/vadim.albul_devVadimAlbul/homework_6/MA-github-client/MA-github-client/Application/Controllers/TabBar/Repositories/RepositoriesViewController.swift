import UIKit

class RepositoriesViewController: BasicViewController {

    // MARK: IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentStackView: UIStackView!
    
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
        guard let repo = self.presentation as? RepositoriesPresentation else { return }
        contentStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        repo.items.forEach { (repository) in
            let repoView = RepositoryView()
            repoView.setContent(repo: repository)
            repoView.delegate = self
            contentStackView.addArrangedSubview(repoView)
        }
        self.view.layoutIfNeeded()
    }
}

// MARK: - extension: RepositoryViewDelegate
extension RepositoriesViewController: RepositoryViewDelegate {
    
    func selectReposiory(with identifier: String, in view: RepositoryView) {
        guard let repositories = self.presentation as? RepositoriesPresentation else { return }
        guard let repo = repositories.items.first(where: {$0.identifier == identifier}) else { return }
        let detailVC = DetailRepositoryViewController()
        detailVC.hidesBottomBarWhenPushed = true
        detailVC.presentation = repo
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
