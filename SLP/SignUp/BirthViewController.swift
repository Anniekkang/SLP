//
//  BirthViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/15.
//

import UIKit

class BirthViewController: BaseViewController {

    let mainView = BirthView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .white
        mainView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        mainView.datePicker.addTarget(self, action: #selector(pickerChanged), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        
        
        
    }
    
    @objc func pickerChanged() {
        let dateformatter = DateFormatter()
         dateformatter.dateStyle = .long
        let date = dateformatter.string(from: mainView.datePicker.date)
        mainView.dateLabel.text = date
      
    }
    
}
