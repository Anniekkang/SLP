//
//  BaseViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/07.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
        setConstraints()
        
        
    }
    

    func configuration(){
        
    }
    
    func setConstraints(){
        
    }
   

}

extension BaseViewController : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
        
    }
    
    //textfield에서 text가 변화될 때
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        
        return true
     
    }
    
    
    
    
    
    
}
