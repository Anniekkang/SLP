//
//  SearchViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/24.
//

import UIKit

class SearchViewController: BaseViewController {

    let mainView = SearchView()
    
    override func loadView() {
        self.view = mainView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = colorCustom.shared.whiteColor
        
    }
    

    

}
