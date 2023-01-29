//
//  ProfileViewController.swift
//  RedditMessenger
//
//  Created by Оливер Салихов on 23.01.2023.
//

import Foundation
import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    let smallFont = UIFont(name: "Times New Roman", size: 10)
    let bigFont = UIFont(name: "Times New Roman Bold", size: 24)
    let middleBigFont = UIFont(name: "Times New Roman", size: 20)
    let middleFont = UIFont(name: "Times New Roman Bold", size: 14)
    
    
    var presenter: ProfilePresenter!
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        return view
    }()
    
    private lazy var profileInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return view
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemBlue, for: .highlighted)
        button.titleLabel?.font = bigFont
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    private lazy var avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        return imageView
    }()
    
    private lazy var userName: UILabel = {
        let label = UILabel()
        label.text = "All1812"
        label.font = bigFont
        label.backgroundColor = .clear
        label.textColor = .white
        return label
    }()
    
    private lazy var followersCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1 follower >"
        label.font = middleFont
        label.backgroundColor = .clear
        label.textColor = .white
        return label
    }()
    
    private lazy var userKarmaLabel: UILabel = {
        let label = UILabel()
        label.text = "u/All1812 | 1 karma | 26 Dec 2022"
        label.font = smallFont
        label.backgroundColor = .clear
        label.textColor = .white
        return label
    }()
    
    private lazy var addSocialLinkButton: UIButton = {
        let button = UIButton()
        button.setTitle("+ Add social link", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemBlue, for: .highlighted)
        button.titleLabel?.font = middleFont
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.backgroundColor = .darkGray
        return button
    }()
    
    private func userActivityLabel() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .clear
        button.titleLabel?.font = middleBigFont
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemBlue, for: .highlighted)
        button.frame = CGRect(x: 0, y: 0, width: view.frame.width / 3, height: 20)
        return button
    }
    
    private lazy var stackWithProfileActivity: UIStackView = {
        let stackView = UIStackView()
        var activityLabels: [UILabel] = []
        let activityNamesArray = ["Posts", "Comments", "About"]
        for i in activityNamesArray {
            let userActivityLabel = userActivityLabel()
            userActivityLabel.setTitle(i, for: .normal)
            stackView.addArrangedSubview(userActivityLabel)
        }
        stackView.backgroundColor = .clear
        stackView.distribution = .equalCentering
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let activityUserCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.addTarget(self, action: #selector(segueToEditProfile), for: .touchUpInside)
        setViews()
        setConstraints()
        setCollectionView()
    }
    
    @objc private func segueToEditProfile() {
        let profileEditViewController = presenter.segueToEditProfileView()
        present(profileEditViewController, animated: true)
    }
    
    private func setCollectionView() {
        activityUserCollection.delegate = self
        activityUserCollection.dataSource = self
    }
    
    private func setViews() {
        view.addSubview(headerView)
        headerView.addSubview(profileInfoView)
        headerView.addSubview(avatar)
        headerView.addSubview(editButton)
        profileInfoView.addSubview(userName)
        profileInfoView.addSubview(followersCountLabel)
        profileInfoView.addSubview(userKarmaLabel)
        view.addSubview(addSocialLinkButton)
        view.addSubview(stackWithProfileActivity)
    }
    
    private func setConstraints() {
        headerView.snp.makeConstraints { make in
            make.height.equalTo(300)
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        profileInfoView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
        }
        
        avatar.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(60)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
        editButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(40)
            make.width.equalTo(60)
            make.bottom.equalTo(profileInfoView.snp_topMargin).offset(-15)
        }
        
        userName.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        followersCountLabel.snp.makeConstraints { make in
            make.top.equalTo(userName.snp_bottomMargin).inset(-10)
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(12)
            make.width.equalTo(100)
        }
        
        userKarmaLabel.snp.makeConstraints { make in
            make.top.equalTo(followersCountLabel.snp_bottomMargin).inset(-10)
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(12)
            make.width.equalTo(200)
        }
        
        addSocialLinkButton.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp_bottomMargin).inset(-20)
            make.left.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
        stackWithProfileActivity.snp.makeConstraints { make in
            make.top.equalTo(addSocialLinkButton.snp_bottomMargin).inset(-20)
            make.width.equalToSuperview()
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
    }
}

extension ProfileViewController: ProfileProtocol {
    
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
