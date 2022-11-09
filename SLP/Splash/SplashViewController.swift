//
//  SplashViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/11.
//

import UIKit

class SplashViewController: BaseViewController {


    
    let mainView = SplashView()
    override func loadView() {
        self.view = mainView
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = .brown
       
    }
    


}
