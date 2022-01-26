//
//  ListDetailsRepositoryViewController.swift


import UIKit

 
class ListDetailsRepositoryViewController: UIViewController {
        
    private lazy var contentView: ListDetailsRepositoryView = {
        let view = ListDetailsRepositoryView()
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(back))
    }
    
    @objc private func back() {
        navigationController?.popViewController(animated: true)
    }
    
    override func loadView() {
        self.view = contentView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

