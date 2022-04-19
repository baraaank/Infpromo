//
//  TabBarController.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 27.01.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = HomeViewController()
        let vc2 = PastReportViewController()
        let vc3 = BuyReportViewController()
        let vc4 = ProfileViewController()
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        
        
        nav1.tabBarItem = UITabBarItem(title: "Anasayfa", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Raporlarım", image: UIImage(systemName: "book"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Satın Al", image: UIImage(systemName: "plus.rectangle"), tag: 1)
        nav4.tabBarItem = UITabBarItem(title: "Profilim", image: UIImage(systemName: "person"), tag: 1)
        
        tabBar.tintColor = UIColor().infpromo
//        tabBar.tintColor = UIColor.black
        navigationController?.navigationBar.tintColor = .systemGray6
        tabBar.barTintColor = .white
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: false)
        
        
     
    }
    


}
