//
//  ErrorViewGeneric.swift

import UIKit

public class ErrorViewGeneric: UIView {
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .purple
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .purple
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .purple
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var actionButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tente Novamente", for: .normal)
        button.titleColor(for: .highlighted)
        button.setTitleColor(.purple, for: .normal)
        button.isHidden = true
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    var reloadAction: (() -> Void)? = nil {
        didSet {
            actionButton.isHidden = false
        }
    }
        
    public init() {
        super.init(frame: .zero)
        setupViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @objc
    private func buttonAction() {
        reloadAction?()
        removeFromSuperview()
    }
}

// MARK: Configuration

extension ErrorViewGeneric {
    func setupViewHierarchy() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(actionButton)
    }
    
    func setupConstraints() {
        self.imageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(60)
            make.trailing.equalTo(self.snp.trailing).offset(-24)
            make.leading.equalTo(self.snp.leading).offset(24)
            make.height.equalTo(300)
        }
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.imageView.snp.bottom).offset(8)
            make.centerX.equalTo(self.snp.centerX)
        }
        self.subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(16)
            make.centerX.equalTo(self.snp.centerX)
        }
        self.actionButton.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-24)
            make.leading.equalTo(self.snp.leading).offset(24)
            make.bottom.equalTo(self.snp.bottom).offset(-48)
            make.height.equalTo(48)
        }
    }
    
    func configureViews() {
        imageView.image = #imageLiteral(resourceName: "imageGithub")
        titleLabel.text = "Ops, ocorreu um erro"
        subtitleLabel.text = "Verifique o seu sinal de internet :)"
        self.backgroundColor = .systemGroupedBackground
        actionButton.layer.borderColor = UIColor.purple.cgColor
        actionButton.layer.borderWidth = 1
        actionButton.layer.cornerRadius = 20
    }
}
