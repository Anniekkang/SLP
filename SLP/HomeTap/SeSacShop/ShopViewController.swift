//
//  ShopViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit

class ShopViewController: BaseViewController {

    let mainView = ShopView()
    override func loadView() {
        self.view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = .yellow
        
      
    }
    

    

}
