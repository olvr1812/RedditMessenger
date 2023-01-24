//
//  TabBarController.swift
//  RedditMessenger
//
//  Created by Георгий Матченко on 24.01.2023.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = configureTabBar()
        customizationTabBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTabBar() -> [UIViewController]{
        var controllers: [UIViewController] = []
        
        let newslineViewController = UIViewController() // add controller
        newslineViewController.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "doc.text.image"), selectedImage: UIImage(systemName: "doc.text.image.fill"))
        let friendsNavigationController = UINavigationController(rootViewController: newslineViewController)
        controllers.append(friendsNavigationController)
        
        let chatsViewController = UIViewController() // add controller
        chatsViewController.tabBarItem = UITabBarItem(title: "Chats", image: UIImage(systemName: "text.bubble"), selectedImage: UIImage(systemName: "text.bubble.fill"))
        let chatsNavigationController = UINavigationController(rootViewController: chatsViewController)
        controllers.append(chatsNavigationController)
        
        let profileViewController = UIViewController() // add controller
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        controllers.append(profileNavigationController)
        
        return controllers
    }
    
    private func customizationTabBar() {
        let positionX: CGFloat = 10
        let positionY: CGFloat = 15
        let width = tabBar.bounds.width - (positionX * 2)
        let heigh = tabBar.bounds.height + (positionY * 2)
        
        let beziePath = UIBezierPath(roundedRect: CGRect(x: positionX, y: tabBar.bounds.minY - positionY, width: width, height: heigh), cornerRadius: width / 2)
        
        let roundLayer = CAShapeLayer()
        roundLayer.path = beziePath.cgPath
        roundLayer.fillColor = CGColor(gray: 0.95, alpha: 1)
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemPositioning = .centered
        tabBar.barTintColor = Constants.appColorOrange
        tabBar.backgroundColor = Constants.appColorOrange
        tabBar.tintColor = Constants.appTintColor
    }
}
