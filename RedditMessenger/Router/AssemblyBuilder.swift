//
//  AssemblyModuleBuilder.swift
//  RedditMessenger
//
//  Created by Оливер Салихов on 17.01.2023.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol: AnyObject {
    static func createLaunchScreenModule() -> UIViewController
    static func createSignInController() -> UIViewController
    static func createAuthorizationController() -> UIViewController
    static func createEditeProfileViewController() -> UIViewController
    static func createTabBarController() -> UITabBarController
    static func createProfileViewController() -> UINavigationController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    
    static func createProfileViewController() -> UINavigationController {
        let profileViewController = ProfileViewController()
        let presenter = ProfilePresenter(view: profileViewController)
        profileViewController.presenter = presenter
        profileViewController.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person.2"), selectedImage: UIImage(systemName: "person.2.fill"))
        let navigationController = UINavigationController(rootViewController: profileViewController)
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }
    
    static func createEditeProfileViewController() -> UIViewController {
        let editProfileViewController = EditProfileViewController()
        let presenter = EditProfilePresenter(view: editProfileViewController)
        editProfileViewController.presenter = presenter
        editProfileViewController.modalPresentationStyle = .fullScreen
        editProfileViewController.modalTransitionStyle = .coverVertical
        return editProfileViewController
    }

    
    
    static func createLaunchScreenModule() -> UIViewController {
        let view = LaunchScreenViewController()
        let presenter = LaunchScreenPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func createSignInController() -> UIViewController {
        let view = SignInController()
        view.modalTransitionStyle = .flipHorizontal
        view.modalPresentationStyle = .fullScreen
        return view
    }
    
    static func createAuthorizationController() -> UIViewController {
        let view = AuthorizationViewController()
        view.modalPresentationStyle = .formSheet
        return view
    }
    
    static func createTabBarController() -> UITabBarController {
        let taBarViewController = UITabBarController()
        taBarViewController.modalPresentationStyle = .fullScreen
        return taBarViewController
    }
}
