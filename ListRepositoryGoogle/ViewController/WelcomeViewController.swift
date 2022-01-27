//
//  WelcomeViewController.swift

import UIKit
 
class WelcomeViewController: UIViewController, WelcomeDelegate {
    
    var coordinator: GoogleReposytoryCoordinator?
    
    private lazy var contentView: WelcomeView = {
        let view = WelcomeView()
        view.delegate = self
        return view
    }()
        
    override func loadView() {
        self.view = contentView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func actionButton() {
        guard let navigationController = self.navigationController else { return }
        coordinator = GoogleReposytoryCoordinator(navigation: navigationController)
        coordinator?.start()
    }
}

