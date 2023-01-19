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
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    
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
}
