//
//  ViewController.swift
//  RedditMessenger
//
//  Created by Оливер Салихов on 16.01.2023.
//

import UIKit
import SnapKit

class LaunchScreenViewController: UIViewController, LaunchScreenProtocol {
    
    var presenter: LaunchScreenPresenter!
    
    private lazy var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.backgroundColor = UIColor.clear
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setViews()
        setConsraints()
        segueAnimate()
    }
    
    private func setView() {
        view.backgroundColor = UIColor.systemOrange
    }
    
    private func setViews() {
        view.addSubview(logo)
    }
    
    private func setConsraints() {
        logo.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
    }
    
    private func segueAnimate() {
        UIView.animate(withDuration: 2, animations: {
            self.view.alpha = 0
        }) { complite in
            if complite {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    let rootVC = self.presenter.goToSignIn()
                    self.present(rootVC, animated: true)
                }
            }
        }
    }
}
