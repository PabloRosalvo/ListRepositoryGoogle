//
//  ListCarColletionCell.swift

import Kingfisher
import SnapKit
import UIKit

final class ListRepositoryGoogleCollectionViewCell: UICollectionViewCell {
    
    var activityView: UIActivityIndicatorView?

    private let imageRepository: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "imageGithub")
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    private let nameRepository: UILabel  = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.configureViews()
        self.setupViewHierarchy()
        self.setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        self.backgroundColor = .black
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
    }
    
    func setup(nameRepository: String, imageUrl: String) {
        self.imageRepository.kf.setImage(with: URL(string: imageUrl))
        self.nameRepository.text = nameRepository
    }

    private func setupViewHierarchy() {
        self.contentView.addSubview(imageRepository)
        self.contentView.addSubview(nameRepository)
    }
    
    private func setupConstraints() {
        self.nameRepository.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(24)
            make.trailing.equalTo(self.snp.trailing).offset(-24)
            make.leading.equalTo(self.snp.leading).offset(24)
        }
        self.imageRepository.snp.makeConstraints { make in
            make.top.equalTo(nameRepository.snp.bottom).offset(24)
            make.centerX.equalTo(snp.centerX).offset(0)
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
      
    }
    
}
