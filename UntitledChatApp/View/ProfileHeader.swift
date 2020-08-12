//
//  ProfileHeader.swift
//  UntitledChatApp
//
//  Created by Herbie on 4/4/20.
//  Copyright © 2020 Herbie Dodge. All rights reserved.
//

import UIKit

protocol ProfileHeaderDelegate: class {
    func dismissController()
}

class ProfileHeader: UIView {
    
    //MARK: - Properties
    var user: User? {
        didSet{populateUserData()}
    }
    
    weak var delegate: ProfileHeaderDelegate?
    
    
    private let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        button.tintColor = .white
        button.imageView?.setDimensions(height: 22, width: 22)
        return button
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 4.0
        return imageView
    }()
    
    private let fullNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Eddie Brock"
        return label
    }()
    
    private let usernameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "venom"
        return label
    }()
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    @objc func handleDismissal() {
        delegate?.dismissController()
    }
    
    
    //MARK: - Helpers
    
    func populateUserData() {
        guard let user = user else { return }
        fullNameLabel.text = user.fullname
        usernameLabel.text = "@" + user.username
        
        guard let url = URL(string: user.profileImageUrl) else { return }
        profileImageView.sd_setImage(with: url)
    }
    
    func configureUI() {
        configureGradiantLayer()
        profileImageView.setDimensions(height: 200, width: 200)
        profileImageView.layer.cornerRadius = 200 / 2
        
        addSubview(profileImageView)
        profileImageView.centerX(inView: self)
        profileImageView.anchor(top: topAnchor, paddingTop: 96)
        
        let stack = UIStackView(arrangedSubviews: [fullNameLabel,usernameLabel])
        stack.axis = .vertical
        stack.spacing = 4
        
        addSubview(stack)
        stack.centerX(inView: self)
        stack.anchor(top: profileImageView.bottomAnchor, paddingTop: 16)
        
        addSubview(dismissButton)
        dismissButton.anchor(top: topAnchor, left: leftAnchor, paddingTop: 44, paddingLeft: 12)
        dismissButton.setDimensions(height: 48, width: 48)
    }
    
    func configureGradiantLayer() {
        let gradiant = CAGradientLayer()
        gradiant.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        gradiant.locations = [0, 1]
        layer.addSublayer(gradiant)
        gradiant.frame = bounds
    }
}
