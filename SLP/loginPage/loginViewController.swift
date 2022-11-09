//
//  loginViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/08.
//

import UIKit

class loginViewController: BaseViewController {

    let mainView = loginView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = colorCustom.shared.whiteColor
      
    }
    

    override func configuration() {
        
        
    }
    
    override func setConstraints() {
        
        
    }
    
    
    
   

}
