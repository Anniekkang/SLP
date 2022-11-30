//
//  GenderViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/15.
//

import UIKit

class GenderViewController: BaseViewController {
    
    var gender : Int = 2
    let mainView = GenderView()
    var maleNum = 0
    var femaleNum = 1
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mainView.backgroundColor = .white
        mainView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        gesture()
        
    }
    
    
    func gesture() {
        let maleGesture = UITapGestureRecognizer(target: self, action: #selector(maleViewClicked))
        let femaleGesture = UITapGestureRecognizer(target: self, action: #selector(femaleViewClicked))
        mainView.maleView.addGestureRecognizer(maleGesture)
        mainView.femaleView.addGestureRecognizer(femaleGesture)
        
    }
    
    
    @objc func maleViewClicked() {
        mainView.maleView.backgroundColor = colorCustom.shared.whiteBrandColor
        mainView.femaleView.backgroundColor = colorCustom.shared.whiteColor
        customButton.changedButton(view: nil, button: mainView.button)
        gender = maleNum
    }
    
    @objc func femaleViewClicked() {
        mainView.femaleView.backgroundColor = colorCustom.shared.whiteBrandColor
        mainView.maleView.backgroundColor = colorCustom.shared.whiteColor
        customButton.changedButton(view: nil, button: mainView.button)
        gender = femaleNum
    }
    
    @objc func buttonTapped() {
        
        if gender == 2 {
            mainView.makeToast("성별을 선택해주시기 바랍니다", duration: 1.0, position: .center)
            return
        }
        
        Repository.Gender = gender
        
        SignUpAPIManager.shared.sendSignUpData(query: TokenID.tokenID) { statusCode in
           
            print("=========\(Repository.phoneNumber)\(Repository.FCMToken),\(Repository.nickName),\(Repository.Birth),\(Repository.Email),\(Repository.Gender)")
            
            switch statusCode {
            case 200 :
                print("SignUp Success")
                Transition.changedRV(vc: TabBarController())
            case 201 :
                print("already registered")
                Transition.changedRV(vc: TabBarController())
            case 202 :
                print("unabled Nickname")
                self.navigationController?.pushViewController(nickNameViewController(), animated: true)
            case 401 :
                print("Firebase Token Error")
            case 500 :
                print("Server Error")
            case 501 :
                print("Client Error")
            default :
                return
            }
        }
        
    }
    
    
    
}
