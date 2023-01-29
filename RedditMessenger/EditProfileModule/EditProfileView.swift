//
//  EditProfileView.swift
//  RedditMessenger
//
//  Created by Оливер Салихов on 29.01.2023.
//

import Foundation
import UIKit

protocol EditProfileViewDelegateProtocol: AnyObject {
    func tapExitButton(selector: Selector)
    func tapSaveButton(selector: Selector)
}

class EditProfileView: UIView {
    
    private let discriptionFontSize: CGFloat = 15
    private let labelFontSize: CGFloat = 18
    
    private var contentSize: CGSize {
        CGSize(width: self.frame.width, height: 800)
    }
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = true
        scroll.backgroundColor = .black
        scroll.contentSize = contentSize
        return scroll
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "Edit Profile"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var exiteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "multiply@4x"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("SAVE", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.systemGray, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Times New Roman", size: 14)
        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var headerAvatarView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
        return imageView
    }()
    
    private lazy var headerAvatarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrow.triangle.2.circlepath.camera@4x"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var smallAvatarView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.image = UIImage(named: "smallAvatar")
        return imageView
    }()
    
    private lazy var displayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Display name (optional)"
        label.textAlignment = .left
        label.textColor = .white
        label.backgroundColor = .clear
        label.font = UIFont(name: "Times New Roman", size: labelFontSize)
        return label
    }()
    
    private lazy var displayNameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Shown on your profile page", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray4])
        textField.font = UIFont(name: "Times New Roman", size: labelFontSize)
        textField.backgroundColor = .gray
        textField.textColor = .white
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private lazy var descriptionDisplayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "This will be displayed to viewers of your profile page and does not change your username"
        label.numberOfLines = 0
        label.textColor = .systemGray4
        label.font = UIFont(name: "Times New Roman", size: discriptionFontSize)
        return label
    }()
    
    private lazy var aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "About (optional)"
        label.textAlignment = .left
        label.textColor = .white
        label.backgroundColor = .clear
        label.font = UIFont(name: "Times New Roman", size: labelFontSize)
        return label
    }()
    
    private lazy var aboutTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "A little description of yourself", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray4])
        textField.font = UIFont(name: "Times New Roman", size: labelFontSize)
        textField.backgroundColor = .gray
        textField.textColor = .white
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private lazy var socialLinksLabel: UILabel = {
        let label = UILabel()
        label.text = "Social Links (5 max)"
        label.textAlignment = .left
        label.textColor = .white
        label.backgroundColor = .clear
        label.font = UIFont(name: "Times New Roman", size: labelFontSize)
        return label
    }()
    
    private lazy var descriptionSocialLinksLabel: UILabel = {
        let label = UILabel()
        label.text = "Peaople who visit your Reddit profile will see your social links."
        label.numberOfLines = 0
        label.textColor = .systemGray4
        label.font = UIFont(name: "Times New Roman", size: discriptionFontSize)
        return label
    }()
    
    private lazy var addSocialLinkButton: UIButton = {
        let button = UIButton()
        button.setTitle("+ Add", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.darkGray, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var contentVisibilityLabel: UILabel = {
        let label = UILabel()
        label.text = "Contenr visbility"
        label.textAlignment = .left
        label.textColor = .white
        label.backgroundColor = .clear
        label.font = UIFont(name: "Times New Roman", size: labelFontSize)
        return label
    }()
    
    private lazy var descriptionContentVisibilityLabel: UILabel = {
        let label = UILabel()
        label.text = "Posts to this profile can appear in r/all and your profile can be discovered in /users"
        label.numberOfLines = 0
        label.textColor = .systemGray4
        label.font = UIFont(name: "Times New Roman", size: discriptionFontSize)
        return label
    }()
    
    private lazy var contentVisibilitySwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.onTintColor = .systemBlue
        switcher.thumbTintColor = .white
        return switcher
    }()
    
    private lazy var showCommunitiesLabel: UILabel = {
        let label = UILabel()
        label.text = "Show active communities"
        label.textAlignment = .left
        label.textColor = .white
        label.backgroundColor = .clear
        label.font = UIFont(name: "Times New Roman", size: labelFontSize)
        return label
    }()
    
    private lazy var descriptionShowCommunitiesLabel: UILabel = {
        let label = UILabel()
        label.text = "Decide whether to show the communities you are active in on your profile"
        label.numberOfLines = 0
        label.textColor = .systemGray4
        label.font = UIFont(name: "Times New Roman", size: discriptionFontSize)
        return label
    }()
    
    private lazy var showCommunitiesSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.onTintColor = .systemBlue
        switcher.thumbTintColor = .white
        return switcher
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        addSubview(titleView)
        titleView.addSubview(exiteButton)
        titleView.addSubview(titleLable)
        titleView.addSubview(saveButton)
        addSubview(scrollView)
        scrollView.addSubview(headerAvatarView)
        headerAvatarView.addSubview(headerAvatarButton)
        headerAvatarView.addSubview(smallAvatarView)
        scrollView.addSubview(displayNameLabel)
        scrollView.addSubview(displayNameTextField)
        scrollView.addSubview(descriptionDisplayNameLabel)
        scrollView.addSubview(aboutLabel)
        scrollView.addSubview(aboutTextField)
        scrollView.addSubview(socialLinksLabel)
        scrollView.addSubview(descriptionSocialLinksLabel)
        scrollView.addSubview(addSocialLinkButton)
        scrollView.addSubview(contentVisibilityLabel)
        scrollView.addSubview(descriptionContentVisibilityLabel)
        scrollView.addSubview(contentVisibilitySwitch)
        scrollView.addSubview(showCommunitiesLabel)
        scrollView.addSubview(descriptionShowCommunitiesLabel)
        scrollView.addSubview(showCommunitiesSwitch)
    }
    
    private func setConstraints() {
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(80)
        }
        
        titleLable.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(20)
        }
        
        exiteButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.leading.equalToSuperview().inset(10)
            make.width.equalTo(15)
            make.height.equalTo(13.5)
        }
        
        saveButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(5)
            make.width.equalTo(80)
            make.height.equalTo(10)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp_bottomMargin).inset(-10)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        headerAvatarView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(170)
            make.centerX.equalToSuperview()
        }
        
        headerAvatarButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        smallAvatarView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(-10)
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        displayNameLabel.snp.makeConstraints { make in
            make.top.equalTo(headerAvatarView.snp_bottomMargin).inset(-40)
            make.width.equalToSuperview()
            make.height.equalTo(15)
            make.left.equalToSuperview().inset(10)
        }
        
        displayNameTextField.snp.makeConstraints { make in
            make.top.equalTo(displayNameLabel.snp_bottomMargin).inset(-15)
            make.width.equalToSuperview()
            make.height.equalTo(40)
            make.left.equalToSuperview()
        }
        
        descriptionDisplayNameLabel.snp.makeConstraints { make in
            make.top.equalTo(displayNameTextField.snp_bottomMargin).inset(-15)
            make.width.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        aboutLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionDisplayNameLabel.snp_bottomMargin).inset(-40)
            make.width.equalToSuperview()
            make.height.equalTo(15)
            make.left.equalToSuperview().inset(10)
        }
        
        aboutTextField.snp.makeConstraints { make in
            make.top.equalTo(aboutLabel.snp_bottomMargin).inset(-15)
            make.width.equalToSuperview()
            make.height.equalTo(160)
            make.left.equalToSuperview()
        }
        
        socialLinksLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutTextField.snp_bottomMargin).inset(-40)
            make.width.equalToSuperview()
            make.height.equalTo(15)
            make.left.equalToSuperview().inset(10)
        }
        
        descriptionSocialLinksLabel.snp.makeConstraints { make in
            make.top.equalTo(socialLinksLabel.snp_bottomMargin).inset(-15)
            make.width.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        addSocialLinkButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionSocialLinksLabel.snp_bottomMargin).inset(-15)
            make.left.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(70)
        }
        
        contentVisibilityLabel.snp.makeConstraints { make in
            make.top.equalTo(addSocialLinkButton.snp_bottomMargin).inset(-40)
            make.height.equalTo(15)
            make.left.equalToSuperview().inset(10)
        }
        
        contentVisibilitySwitch.snp.makeConstraints { make in
            make.top.equalTo(contentVisibilityLabel.snp_bottomMargin)
            make.right.equalTo(self.snp_rightMargin).inset(-60)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        descriptionContentVisibilityLabel.snp.makeConstraints { make in
            make.top.equalTo(contentVisibilityLabel.snp_bottomMargin).inset(-15)
            make.right.equalTo(contentVisibilitySwitch.snp_leftMargin)
            make.left.equalToSuperview()
        }
        
        showCommunitiesLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionContentVisibilityLabel.snp_bottomMargin).inset(-40)
            make.height.equalTo(15)
            make.left.equalToSuperview().inset(10)
        }
        
        showCommunitiesSwitch.snp.makeConstraints { make in
            make.top.equalTo(showCommunitiesLabel.snp_bottomMargin)
            make.right.equalTo(self.snp_rightMargin).inset(-60)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        descriptionShowCommunitiesLabel.snp.makeConstraints { make in
            make.top.equalTo(showCommunitiesLabel.snp_bottomMargin).inset(-15)
            make.right.equalTo(showCommunitiesSwitch.snp_leftMargin)
            make.left.equalToSuperview()
        }
    }
}

extension EditProfileView: EditProfileViewDelegateProtocol {
    
    func tapSaveButton(selector: Selector) {
        saveButton.addTarget(Any.self, action: selector, for: .touchUpInside)
    }
    
    func tapExitButton(selector: Selector) {
        exiteButton.addTarget(Any.self, action: selector, for: .touchUpInside)
    }
}
