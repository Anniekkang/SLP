//
//  nickNameViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/15.
//

import UIKit
import Toast

class nickNameViewController: BaseViewController {

    let mainView = nickNameView()
    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = .white
        mainView.textField.delegate = self
        mainView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonTapped() {
        var text = mainView.textField.text
        guard let count = text?.count else { return }
        if count < 1 || count > 11 {
            self.view.makeToast("닉네임은 1자 이상 10자 이내로 부탁드려요.",duration: 1.0,position: .center)
            text = ""
        } else if text?.filter({ $0.isNumber}).count != 0 {
            self.view.makeToast("닉네임은 실명으로 부탁드려요.",duration: 1.0,position: .center)
            text = ""
        } else {
            
            UserDefaults.standard.set(text, forKey: "nickName")
            let vc = BirthViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
   
}

extension nickNameViewController {
    
    override func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        customTextField.customTextFieldView(view: mainView.view)
        return true
    }
    
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = mainView.textField.text else { return false }
      
        if !text.isEmpty {
            
            customButton.changedButton(view: mainView.view, button: mainView.button)
            
        }
        
        return true
    }
    
    
    
    
    
}
