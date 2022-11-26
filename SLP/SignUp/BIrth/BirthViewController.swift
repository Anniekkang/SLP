//
//  BirthViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/15.
//

import UIKit
import Toast

class BirthViewController: BaseViewController {

    static var currentAgeDay : Int = 1
    static var year : String?
    static var month : String?
    static var day : String?
    
    
    let mainView = BirthView()
    override func loadView() {
        self.view = mainView
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .white
        mainView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        mainView.datePicker.addTarget(self, action: #selector(pickerChanged), for: .valueChanged)
        
     
    }
    
    @objc func buttonTapped() {
        if mainView.dayTextField.text?.isEmpty == true {
            mainView.makeToast("생년월일을 정확히 선택해주시기 바랍니다", duration: 1.0, position: .center)
        } else {
            
            
            if BirthDateFormatter.calDate(birthdate: mainView.datePicker.date) == false {
                mainView.makeToast("새싹스터디는 만 17세 이상만 사용할 수 있습니다.", duration: 1.0, position: .center)
            } else {
                
                Repository.Birth = mainView.datePicker.date
                
                let vc = EmailViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            
        }
        
    }
    
    @objc func pickerChanged() {
        BirthDateFormatter.changeDatetoString(date: mainView.datePicker.date)
        
        
        mainView.yearTextField.text = BirthViewController.year
        mainView.monthTextField.text = BirthViewController.month
        mainView.dayTextField.text = BirthViewController.day

        
        if mainView.dayTextField.text?.isEmpty == false {
            
            mainView.button.backgroundColor = colorCustom.shared.greenBrandColor
            mainView.button.setTitleColor(colorCustom.shared.whiteColor, for: .normal)
            
            
        }
        
    }
    
    
    
}
