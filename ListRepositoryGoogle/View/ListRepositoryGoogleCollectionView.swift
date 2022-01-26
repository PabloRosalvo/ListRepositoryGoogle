//
//  ListRepositoryGoogleCollectionView.swift
//  WebmotorsTeste
//
//

import UIKit

class ListRepositoryGoogleCollectionView: UIView {
        
    var activityView = UIActivityIndicatorView(style: .large)

    let titleLabel: UILabel  = {
        let label = UILabel()
        label.text = "Lista de Repositórios"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 25
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureViews()
        setupViewHierarchy()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        collectionView.backgroundColor = .white
    }
    
    func showActivityIndicator() {
        activityView.color = .black
        activityView.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityView.stopAnimating()
    }
    
    func setDataSource(_ dataSource: ListRepositoryDataSource) {
        self.collectionView.delegate = dataSource
        self.collectionView.dataSource = dataSource
        dataSource.collectionView = self.collectionView
    }
    
    private func setupViewHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(collectionView)
        self.addSubview(activityView)
    }
    
    private func setupConstraints() {
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
            make.leading.equalTo(self.snp.leading).offset(16)
        }
        
        self.activityView.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.centerY.equalTo(snp.centerY)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-24)
            make.leading.equalTo(self.snp.leading).offset(24)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
}

