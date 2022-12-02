//
//  SearchViewController.swift
//  SLP
//
//  Created by 나리강 on 2022/11/24.
//

import UIKit
import Foundation

class AddStudyViewController: BaseViewController, UISearchBarDelegate {

    let mainView = AddStudyView()
    let searchBar = UISearchBar()
    var studyName : [String] = []
    var studyArray : [String] = []
    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        SearchAPIManager.shared.nearSesacSearch(query: TokenID.tokenID) { statusCode in
            switch statusCode {
            case 200 :
                print("success API")
                self.mainView.collectionView.reloadData()
            case 401 :
                print("FIrebaseTokenError")
                
                getID.shared.getIDToken { idToken in
                    UserDefaults.standard.set(idToken, forKey: Repository.tokenID.rawValue)
                }
                AuthAPIManager.shared.fetchloginData(query: TokenID.tokenID) { statusCode in
                    switch statusCode {
                    case 200 :
                        print("success API")
                        self.mainView.collectionView.reloadData()
                   
                    default :
                        print("error again : \(statusCode)")
                    }
                }
            case 406 :
                print("unregistered User")
            case 500 :
                print("server error")
            case 501 :
                print("client error")
            default :
                print("extra situation")
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        mainView.backgroundColor = colorCustom.shared.whiteColor
        mainView.button.addTarget(self, action: #selector(stopFindButtonTapped), for: .touchUpInside)
        tabBarController?.tabBar.isHidden = true
        navDesign(searchBar: searchBar)
        searchBarDesign(searchBar: searchBar)
    
        
    }
    
    override func configuration() {
        searchBar.delegate = self
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(firstSectionCell.self, forCellWithReuseIdentifier: firstSectionCell.id)
        mainView.collectionView.register(secondSectionCell.self, forCellWithReuseIdentifier: secondSectionCell.id)
        mainView.collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.id)
    }
    
    @objc func stopFindButtonTapped() {
        
        SearchAPIManager.shared.requestSesacFind(query : TokenID.tokenID, completionHandler: { statusCode in
            
            switch statusCode {
            case 200 :
                print("success API")
                self.mainView.collectionView.reloadData()
            case 401 :
                print("FIrebaseTokenError")
                
                getID.shared.getIDToken { idToken in
                    UserDefaults.standard.set(idToken, forKey: Repository.tokenID.rawValue)
                }
                AuthAPIManager.shared.fetchloginData(query: TokenID.tokenID) { statusCode in
                    switch statusCode {
                    case 200 :
                        print("success API")
                        self.mainView.collectionView.reloadData()
                   
                    default :
                        print("error again : \(statusCode)")
                    }
                }
            case 406 :
                print("unregistered User")
            case 500 :
                print("server error")
            case 501 :
                print("client error")
            default :
                print("extra situation")
            }
            
            
            
            
            self.navigationController?.pushViewController(SearchViewController(), animated: true)
            
        })
                                                
        
    }
    
    func searchBarDesign(searchBar : UISearchBar) {
        searchBar.placeholder = "띄어쓰기로 복수 입력이 가능해요"
       // searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = colorCustom.shared.gray1
        searchBar.returnKeyType = .default
    }

    func navDesign(searchBar : UISearchBar) {
        
        self.navigationController?.navigationBar.tintColor = colorCustom.shared.blackColor
        self.navigationItem.titleView = searchBar
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationController?.navigationBar.isTranslucent = false //반투명도 제거
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.setTitleVerticalPositionAdjustment(CGFloat(), for: .defaultPrompt)
        self.navigationController?.navigationBar.standardAppearance = setNavigationBarAppearance()
        self.navigationController?.navigationBar.scrollEdgeAppearance = setNavigationBarAppearance()

    }
    
    func setNavigationBarAppearance() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
      
        return appearance
    }
    
    
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
   
    
    @objc func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        guard let text = self.searchBar.text else { return }
        studyName = text.components(separatedBy: " ")
        
        if studyName.filter({ String in String.count > 8 }).isEmpty == false || studyName.isEmpty == true {
            mainView.makeToast("최소 한 자 이상, 최대 8글자까지 작성 가능합니다", duration: 1.0, position: .center)
            return

        } else if studyName.last == "" {
            studyName.removeLast()
            
        }
        
        studyArray.append(contentsOf: studyName)
        print("studyArray========\(studyArray)")
        print("studyName ========\(studyName)")
        
    }
}
