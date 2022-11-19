//
//  TabBarViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit

class TabBarController : UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
        self.tabBar.unselectedItemTintColor = colorCustom.shared.blackColor
        self.tabBar.backgroundColor = .white
    }

    
    func configuration(){
        
        let firstTap = HomeViewController()
        let nav1 = UINavigationController(rootViewController: firstTap)
        let secondTap = ShopViewController()
        let nav2 = UINavigationController(rootViewController: secondTap)
        let fourthTap = MyPageViewController()
        let nav4 = UINavigationController(rootViewController: fourthTap)
        self.setViewControllers([nav1,nav2,nav4], animated: true)
        
        if let items = self.tabBar.items {
            items[0].selectedImage = UIImage(named: "house")
            items[0].image = UIImage(named: "house")
            items[1].selectedImage = UIImage(named: "gift")
            items[1].image = UIImage(named: "gift")
            items[2].selectedImage = UIImage(named: "gift")
            items[2].image = UIImage(named: "gift")
        }
    }

    

}
