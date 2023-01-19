//
//  LaunchScreenPresenter.swift
//  RedditMessenger
//
//  Created by Оливер Салихов on 17.01.2023.
//

import Foundation
import UIKit

protocol LaunchScreenProtocol: AnyObject {
    
}

protocol LaunchScreenPresenterProtocol: AnyObject {
    init(view: LaunchScreenProtocol)
    func goToSignIn() -> UIViewController
}

class LaunchScreenPresenter: LaunchScreenPresenterProtocol {
    
    weak var view: LaunchScreenProtocol?
    
    required init(view: LaunchScreenProtocol) {
        self.view = view
    }
    
    func goToSignIn() -> UIViewController {
        let rootVC = AssemblyBuilder.createSignInController()
        return rootVC
    }
    
    
}
