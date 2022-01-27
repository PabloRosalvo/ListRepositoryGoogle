//
//  WelcomeView.swift

import UIKit
import SnapKit

final class ListDetailsRepositoryView: UIView, ViewConfiguration {
    
    let viewModel: ListGithubDetailsViewModel
    
    private lazy var imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.layer.cornerRadius = 14
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    
    private lazy var nameRepositoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var descriptionRepositoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()


    init(frame: CGRect = .zero, viewModel: ListGithubDetailsViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        backgroundColor = .white
        setupLayout()
    }
    
    func setupLayout() {
        self.imageView.kf.setImage(with: URL(string: viewModel.image))
        nameRepositoryLabel.text = viewModel.name
        descriptionRepositoryLabel.text = viewModel.setDescription()
    }

    func setupViewHierarchy() {
        addSubview(imageView)
        addSubview(nameRepositoryLabel)
        addSubview(descriptionRepositoryLabel)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(100)
            make.centerX.equalTo(snp.centerX).offset(0)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }

        nameRepositoryLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(60)
            make.leading.equalTo(snp.leading).offset(48)
            make.trailing.equalTo(snp.trailing).offset(-48)
        }
        
        descriptionRepositoryLabel.snp.makeConstraints { make in
            make.top.equalTo(nameRepositoryLabel.snp.bottom).offset(60)
            make.leading.equalTo(snp.leading).offset(48)
            make.trailing.equalTo(snp.trailing).offset(-48)
        }
    }
}
