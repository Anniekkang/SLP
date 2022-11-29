//
//  MyPageViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit

class MyPageViewController: BaseViewController {

  
    
    let mainView = MyPageView()
    
    override func loadView() {
        self.view = mainView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "내정보"
        configuration()
       
    }
 
    override func configuration() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.id)
        mainView.tableView.register(NameTableViewCell.self, forCellReuseIdentifier: NameTableViewCell.id)
        mainView.backgroundColor = .white
    }
    
    
    func buttonTapped(){
         print(#function)
        guard let tokenId = UserDefaults.standard.string(forKey: Repository.tokenID.rawValue) else { return }
        AuthAPIManager.shared.fetchloginData(query: tokenId) { statusCode in
            switch statusCode {
            case 200 :
                print("login success")
                print("----------------parameters.nick:\(parameters().nick)")
                self.navigationController?.pushViewController(ManageMyInfoViewController(), animated: true)
            case 401 :
                print("firebase token error")
                getID.shared.getIDToken { idToken in
                    UserDefaults.standard.set(idToken, forKey: Repository.tokenID.rawValue)
                }
                guard let newID = UserDefaults.standard.string(forKey: Repository.tokenID.rawValue) else { return }
                print("=========\(newID)")
                AuthAPIManager.shared.fetchloginData(query: newID) { statusCode in
                    switch statusCode {
                    case 200 :
                        print("Auth Success")
                        self.navigationController?.pushViewController(TabBarController(), animated: true)
                    case 406 :
                        print("unregistered User")
                        print()
                        DispatchQueue.main.async {
                            print("dispatchqueue")
                            
                            self.navigationController?.pushViewController(nickNameViewController(), animated: true)
                        }
                        
                    default :
                        print("error again")
                    }
                }
            case 406 :
                print("unregistered User")
            case 500 :
                print("server error")
            case 501 :
                print("client error")
            default :
                print("networking error")
                break
            }
            
        }
        
        
       
      
     }

    
}


