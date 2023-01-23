//
//  SignInViewController.swift
//  RedditMessenger
//
//  Created by Оливер Салихов on 17.01.2023.
//

import Foundation
import UIKit

protocol SignInputProtocol: AnyObject {
    func segueToAuthorisationScreen(selector: Selector)
}

class SignInView: UIView {
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "loginPicture")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var signInRedditButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in with VK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name: "Optima-ExtraBlack", size: 20)
        return button
    }()

    private lazy var signInUsernameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in with username", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Optima-ExtraBlack", size: 20)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setConstraintsViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
        setConstraintsViews()
    }

    private func addViews() {
        addSubview(backgroundImageView)
        addSubview(pictureImageView)
        addSubview(signInUsernameButton)
        addSubview(signInRedditButton)
    }

    private func setConstraintsViews() {
        backgroundImageView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
        pictureImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
        }
        signInUsernameButton.snp.makeConstraints { make in
            make.bottom.equalTo(signInRedditButton.snp.top).offset(-20)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(250)
            make.height.equalTo(45)
        }
        
        signInRedditButton.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.height.equalTo(45)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-40)
        }
    }
}

extension SignInView: SignInputProtocol {
    func segueToAuthorisationScreen(selector: Selector) {
        signInUsernameButton.addTarget(Any.self, action: selector, for: .touchUpInside)
    }
    
    
}
