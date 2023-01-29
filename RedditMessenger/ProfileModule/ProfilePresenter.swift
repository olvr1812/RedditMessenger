//
//  ProfilePresenter.swift
//  RedditMessenger
//
//  Created by Оливер Салихов on 23.01.2023.
//

import Foundation
import UIKit

protocol ProfileProtocol: AnyObject {
    
}

protocol ProfilePresenterProtocol: AnyObject {
    init(view: ProfileProtocol)
    func segueToEditProfileView() -> UIViewController
}

class ProfilePresenter: ProfilePresenterProtocol {
    
    weak var view: ProfileProtocol?
    
    required init(view: ProfileProtocol) {
        self.view = view
    }
    
    func segueToEditProfileView() -> UIViewController {
        let editeProfileViewController = AssemblyBuilder.createEditeProfileViewController()
        return editeProfileViewController
    }
}
