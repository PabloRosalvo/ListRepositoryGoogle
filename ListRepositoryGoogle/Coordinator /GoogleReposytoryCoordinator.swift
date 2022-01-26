import UIKit

class GoogleReposytoryCoordinator {
    
    var navigation: UIViewController?
    private var presentingViewController: UINavigationController?

    init(navigation: UINavigationController) {
        self.presentingViewController = navigation
    }
    
    func start() {
        let controller = ListRepositoryGoogleViewController(viewModel: ListRepositoryViewModel(), coordinator: self)
        presentingViewController?.pushViewController(controller, animated: true)
    }

    func showGithubDetails() {
        let controller = ListDetailsRepositoryViewController()
        presentingViewController?.pushViewController(controller, animated: true)
    }
}
