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
    
        self.tabBar.unselectedItemTintColor = colorCustom.shared.gray6
        self.tabBar.selectedImageTintColor = colorCustom.shared.greenBrandColor
        self.tabBar.backgroundColor = .white
    }

    
    func configuration(){
        
        let firstTap = HomeViewController()
        let nav1 = UINavigationController(rootViewController: firstTap)
        let secondTap = ShopViewController()
        let nav2 = UINavigationController(rootViewController: secondTap)
        let thirdTap = FriendViewController()
        let nav3 = UINavigationController(rootViewController: thirdTap)
        let fourthTap = MyPageViewController()
        let nav4 = UINavigationController(rootViewController: fourthTap)
        self.setViewControllers([nav1,nav2,nav3,nav4], animated: true)
        
        
        let firstBarItem = UITabBarItem(title: "홈", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        let secondBarItem = UITabBarItem(title: "새싹샵", image: UIImage(named: "shop"), selectedImage: UIImage(named: "shop"))
        let thirdBarItem = UITabBarItem(title: "새싹친구", image: UIImage(named: "sesac"), selectedImage: UIImage(named: "sesac"))
        let fourthBarItem = UITabBarItem(title: "내정보", image: UIImage(named: "mypage"), selectedImage: UIImage(named: "mypage"))
    
        firstTap.tabBarItem = firstBarItem
        secondTap.tabBarItem = secondBarItem
        thirdTap.tabBarItem = thirdBarItem
        fourthTap.tabBarItem = fourthBarItem
        
        
        self.viewControllers = [nav1,nav2,nav3,nav4]
    }

    

}
