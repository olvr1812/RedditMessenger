//
//  AuthorisationViewController.swift
//  RedditMessenger
//
//  Created by Оливер Салихов on 19.01.2023.
//

import Foundation
import UIKit
import WebKit
import SnapKit

class AuthorizationViewController: UIViewController {
    
    private lazy var authorizationWebView = WKWebView()
    var presenter: AuthorisationPresenter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        view.addSubview(authorizationWebView)
    }
    
    private func setConstraints() {
        authorizationWebView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}

extension AuthorizationViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, navigationResponse: WKNavigationResponse, didBecome download: WKDownload) {
        
    }
}

extension AuthorizationViewController: AuthorizationProtocol {
    func segueToTabBar() {
        // present TabBar
    }
}
