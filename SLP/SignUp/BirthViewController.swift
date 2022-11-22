//
//  BirthViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/15.
//

import UIKit
import Toast

class BirthViewController: BaseViewController {

    let mainView = BirthView()
    let currentAge : Int = 1
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
            if currentAge < 17 {
                mainView.makeToast("새싹스터디는 만 17세 이상만 사용할 수 있습니다.", duration: 1.0, position: .center)
            } else {
                
                let vc = EmailViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            
        }
        
    }
    
    @objc func pickerChanged() {
        let dateformatter = DateFormatter()
         dateformatter.dateFormat = "yyyy,MM,dd"
        let date = dateformatter.string(from: mainView.datePicker.date)
        let dateArray : [String] = date.components(separatedBy: ",")
        print(dateArray)
      
        mainView.yearTextField.text = dateArray[0]
        mainView.monthTextField.text = dateArray[1]
        mainView.dayTextField.text = dateArray[2]

        if mainView.dayTextField.text?.isEmpty == false {
            
            mainView.button.backgroundColor = colorCustom.shared.greenBrandColor
            mainView.button.setTitleColor(colorCustom.shared.whiteColor, for: .normal)
        }
        
    }
    
    
    
}
