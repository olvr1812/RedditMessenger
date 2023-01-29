//
//  SignInController.swift
//  RedditMessenger
//
//  Created by Оливер Салихов on 19.01.2023.
//

import Foundation
import UIKit

class SignInController: UIViewController {
    
    weak var delegate: SignInputProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.segueToAuthorisationScreen(selector: #selector(signInReddit))
        delegate?.segueToTabBar(selector: #selector(segueToTabBar))
    }
    
    override func loadView() {
        super.loadView()
        self.view = createView()
    }
    
    private func createView() -> UIView {
        let view = SignInView()
        self.delegate = view
        return view
    }
    
    @objc private func signInReddit() {
        let authorizationController = AssemblyBuilder.createAuthorizationController()
        present(authorizationController, animated: true)
    }
    
    @objc private func segueToTabBar() {
        let profileViewController = AssemblyBuilder.createProfileViewController()
        profileViewController.modalPresentationStyle = .fullScreen
        present(profileViewController, animated: true)
    }
}
