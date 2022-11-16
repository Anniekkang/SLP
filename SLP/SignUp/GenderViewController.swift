//
//  GenderViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/15.
//

import UIKit

class GenderViewController: BaseViewController {

    let mainView = GenderView()
    
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
