//
//  GenderViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/15.
//

import UIKit

class GenderViewController: BaseViewController {

    var gender : Int?
    let mainView = GenderView()
    var isClicked = [false, false]
    let maleNum = 0
    let femaleNum = 1
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        mainView.backgroundColor = .white
        mainView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        clickedView(view: mainView.femaleView)
        clickedView(view: mainView.maleView)
       
    }
    
    func clickedView(view : UIView) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewClicked))
        view.addGestureRecognizer(gesture)
        
        
    }
    
    @objc func viewClicked() {
        view.backgroundColor = colorCustom.shared.whiteBrandColor
        
        
    }
    
    @objc func buttonTapped() {
    
        

        Transition.changedRV(vc: TabBarController())
       
        
    }

    
}
