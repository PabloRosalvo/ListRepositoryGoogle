//
//  ListRepositoryGooleViewController.swift

import UIKit

final class ListRepositoryGoogleViewController: UIViewController {

    private let viewModel: ListRepositoryViewModel
    private var refreshControl = UIRefreshControl()
    private var coordinator: GoogleReposytoryCoordinator
    
    private let contentView: ListRepositoryGoogleCollectionView = {
        let view = ListRepositoryGoogleCollectionView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var dataSource: ListRepositoryDataSource = {
        let source = ListRepositoryDataSource(delegate: self)
        return source
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchDetails()
        refreshToControl()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(back))
        self.view.backgroundColor = .white
    }
    
    override func loadView() {
        self.view = contentView
    }

    init(viewModel: ListRepositoryViewModel, coordinator: GoogleReposytoryCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func refreshToControl() {
        refreshControl.tintColor = UIColor.white
        refreshControl.addTarget(self, action: #selector(self.refreshData), for: .valueChanged)
        contentView.collectionView.addSubview(refreshControl)
        contentView.collectionView.alwaysBounceVertical = true
    }
    
    @objc private func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func refreshData() {
        fetchDetails()
    }
    
    private func fetchDetails() {
        contentView.showActivityIndicator()
        self.viewModel.fetchDetails { [weak self] success in
            guard let self = self else { return } 
            self.contentView.hideActivityIndicator()
            self.refreshControl.endRefreshing()
            if success {
                self.dataSource.setViewModel(viewModel: self.viewModel)
                self.contentView.setDataSource(self.dataSource)
            } else {
                self.handleError()
            }
        }
    }

    private func handleError() {
        self.ds.showError {
            self.fetchDetails()
        }
    }
    
}

extension ListRepositoryGoogleViewController: ListDataSourceDelegate {
    func seletectIndexPathRow() {
        coordinator.showGithubDetails()
    }
    
}
