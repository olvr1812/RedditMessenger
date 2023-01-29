//
//  ProfilePresenter.swift
//  RedditMessenger
//
//  Created by Оливер Салихов on 29.01.2023.
//

import Foundation
import UIKit

protocol EditProfileProtocol: AnyObject {
    func presentProfileViewController()
}

protocol EditPresenterProtocol: AnyObject {
    init(view: EditProfileProtocol)
    func profileViewController() -> UIViewController
}

class EditProfilePresenter: EditPresenterProtocol {
    
    
    var view: EditProfileProtocol?
    
    required init(view: EditProfileProtocol) {
        self.view = view
    }
    
    func profileViewController() -> UIViewController {
        let profileViewController = AssemblyBuilder.createProfileViewController()
        return profileViewController
    }
}


