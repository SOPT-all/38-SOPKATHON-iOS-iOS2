//
//  TabBarController.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/16/26.
//

import UIKit

import Then

final class MainTabBarController: UITabBarController {
    
    lazy var homeViewController: HomeViewController = HomeViewController().then {
        $0.tabBarItem.title = "home"
        $0.tabBarItem.image = UIImage(resource: .iconHome)
    }
    
    lazy var secondViewController: UIViewController = UIViewController().then {
        $0.tabBarItem.title = "storage"
        $0.tabBarItem.image = UIImage(resource: .iconStorage)
    }
    
    lazy var profileViewController: UIViewController = UIViewController().then {
        $0.tabBarItem.title = "my"
        $0.tabBarItem.image = UIImage(resource: .iconProfile)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
    }
    
    private func setTabBar() {
        tabBar.unselectedItemTintColor = .gray300
        tabBar.tintColor = .main500
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithTransparentBackground()
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        let homeNavigationController = UINavigationController(
            rootViewController: homeViewController
        )
        
        let secondNavigationController = UINavigationController(
            rootViewController: secondViewController
        )
        
        let profileNavigationController = UINavigationController(
            rootViewController: profileViewController
        )
        
        setViewControllers([
            homeNavigationController,
            secondNavigationController,
            profileNavigationController
        ], animated: true)
    }
}
