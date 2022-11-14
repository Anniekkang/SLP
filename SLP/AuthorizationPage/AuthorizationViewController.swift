//
//  AuthorizationViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/09.
//

import UIKit

class AuthorizationViewController: BaseViewController {

    let mainView = AuthorizationView()
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = .white
        mainView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
       
        
    }
   

}
