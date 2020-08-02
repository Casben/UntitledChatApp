//
//  CustomInputAccessoryView.swift
//  UntitledChatApp
//
//  Created by Herbie on 4/2/20.
//  Copyright © 2020 Herbie Dodge. All rights reserved.
//

import UIKit

protocol CustomInputAccessoryViewDelegate: class {
    func inputView(_ inputView: CustomInputAccessoryView, wantsToSend message: String)
}

class CustomInputAccessoryView: UIView {
    //MARK: - Properties
    
    weak var delegate: CustomInputAccessoryViewDelegate?
    
    private var messageInputTextVIew: UITextView = {
       let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isScrollEnabled = false
        return textView
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.systemPurple, for: .normal)
        button.addTarget(self, action: #selector(handleSendMessage), for: .touchUpInside)
        return button
    }()
    private let placeHolderLabel: UILabel = {
       let label = UILabel()
        label.text = "Enter message"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoresizingMask = .flexibleHeight
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 10
        layer.shadowOffset = .init(width: 0, height: -8)
        backgroundColor = .white
        addSubview(sendButton)
        sendButton.anchor(top: topAnchor, right: rightAnchor, paddingTop: 4, paddingRight: 8)
        sendButton.setDimensions(height: 50, width: 50)
        
        addSubview(messageInputTextVIew)
        messageInputTextVIew.anchor(top: topAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: sendButton.leftAnchor, paddingTop: 12, paddingLeft: 4, paddingBottom: 8, paddingRight: 8)
        
        addSubview(placeHolderLabel)
        placeHolderLabel.anchor(left: messageInputTextVIew.leftAnchor, paddingLeft: 4)
        placeHolderLabel.centerY(inView: messageInputTextVIew)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextInputChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return .zero
    }
    
    //MARK: - Selectors
    @objc func handleSendMessage() {
        guard let message = messageInputTextVIew.text else { return }
        delegate?.inputView(self, wantsToSend: message)
    }
    
    @objc func handleTextInputChange() {
        placeHolderLabel.isHidden = !self.messageInputTextVIew.text.isEmpty
    }
    
    //MARK: - Helpers
    
    func clearMessageText() {
        messageInputTextVIew.text = nil
        placeHolderLabel.isHidden = false
    }
}

