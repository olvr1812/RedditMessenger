//
//  AuthorisationPresenter.swift
//  RedditMessenger
//
//  Created by Оливер Салихов on 19.01.2023.
//

import Foundation
import WebKit

protocol AuthorizationProtocol: AnyObject {
    func segueToTabBar()
}

protocol AuthorizationPresenterProtocol: AnyObject {
    init(view: AuthorizationProtocol)
    func checkNavigationResponse(response: WKNavigationResponse) -> String
    func saveToken()
}

class AuthorisationPresenter: AuthorizationPresenterProtocol {
    let view: AuthorizationProtocol?
    
    required init(view: AuthorizationProtocol) {
        self.view = view
    }
    
    func checkNavigationResponse(response: WKNavigationResponse) -> String {
        return "token"
    }
    
    func saveToken() {
        
    }
    
    
}
