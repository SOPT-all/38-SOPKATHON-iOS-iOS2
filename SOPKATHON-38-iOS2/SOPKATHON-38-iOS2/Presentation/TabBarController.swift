//
//  TabBarController.swift
//  SOPKATHON-38-iOS2
//
//  Created by 이상엽 on 5/16/26.
//

import UIKit

import Then

final class MainTabBarController: UITabBarController {
    
    lazy var homeViewController: ViewController = ViewController().then {
        $0.tabBarItem.title = "홈"
        $0.tabBarItem.image = UIImage(systemName: "house.fill")
    }
    
    lazy var secondViewController: UIViewController = UIViewController().then {
        $0.tabBarItem.title = "두번째"
        $0.tabBarItem.image = UIImage(systemName: "person.fill")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
    }
    
    private func setTabBar() {
        tabBar.unselectedItemTintColor = .gray400
        tabBar.tintColor = .gray900
        tabBar.backgroundColor = .gray100
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
        
        setViewControllers([
            homeNavigationController,
            secondNavigationController,
        ], animated: true)
    }
}
