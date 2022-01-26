//
//  WelcomeView.swift

import UIKit
import SnapKit

protocol WelcomeDelegate: AnyObject {
    func actionButton()
}

final class WelcomeView: UIView, ViewConfiguration {
    
    weak var delegate: WelcomeDelegate?

    private lazy var imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "imageGithub")
        imageview.layer.cornerRadius = 14
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Repositórios públicos do Google, veja a lista clicando no botao abaixo. "
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private(set) lazy var actionButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Clique aqui para acessar a lista :)", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 18
        button.titleColor(for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        backgroundColor = .white
        self.actionButton.addTarget(self, action: #selector(self.actionButton(_:)), for: .touchUpInside)
    }
    
    @objc
    private func actionButton(_ sender: UIButton) {
        self.delegate?.actionButton()
    }

    
    func setupViewHierarchy() {
        addSubview(imageView)
        addSubview(label)
        addSubview(actionButton)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(100)
            make.centerX.equalTo(snp.centerX).offset(0)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }

        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(60)
            make.leading.equalTo(snp.leading).offset(48)
            make.trailing.equalTo(snp.trailing).offset(-48)
        }
        
        actionButton.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).offset(24)
            make.trailing.equalTo(snp.trailing).offset(-24)
            make.bottom.equalTo(snp.bottom).offset(-54)
            make.height.equalTo(54)
        }
    }
}
