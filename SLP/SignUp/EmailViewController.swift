//
//  EmailViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/15.
//

import UIKit

class EmailViewController: BaseViewController {

    let mainView = EmailView()
    
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
        
        
        
    }

    override func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        customTextField.customTextFieldView(view: mainView.view)
        return true
    }
    
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = mainView.textField.text else { return false }
        
        
        
        if text.isEmpty {
            
            customButton.changedButton(view: mainView.view, button: mainView.button)
            
        }
        
        return true
    }

}
