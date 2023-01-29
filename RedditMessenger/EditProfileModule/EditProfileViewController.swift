//
//  EditViewController.swift
//  RedditMessenger
//
//  Created by Оливер Салихов on 24.01.2023.
//

import Foundation
import UIKit



class EditProfileViewController: UIViewController {
    
    var delegate: EditProfileViewDelegateProtocol?
    var presenter: EditProfilePresenter!
        
    override func loadView() {
        super.loadView()
        self.view = getView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        delegate?.tapExitButton(selector: #selector(returnToProfileViewController))
        delegate?.tapSaveButton(selector: #selector(chanchedWillSaved))
    }
    
    private func getView() -> UIView {
        let view = EditProfileView()
        delegate = view
        return view
    }
    
    @objc private func chanchedWillSaved() {
        presentProfileViewController()
    }
    
    @objc private func returnToProfileViewController() {
        presentProfileViewController()
    }
    
 
}

extension EditProfileViewController: EditProfileProtocol {
    func presentProfileViewController() {
        let profileViewController = presenter.profileViewController()
        profileViewController.modalTransitionStyle = .flipHorizontal
        present(profileViewController, animated: true)
    }
    

}
