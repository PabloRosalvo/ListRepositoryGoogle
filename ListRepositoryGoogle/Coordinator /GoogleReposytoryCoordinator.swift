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

    func showGithubDetails(_ model: DetailsGitHubModel) {
        let viewModel = ListGithubDetailsViewModel(model: model)
        let controller = ListDetailsRepositoryViewController(viewModel: viewModel)
        presentingViewController?.pushViewController(controller, animated: true)
    }
}
