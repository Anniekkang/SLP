//
//  Func.swift
//  SLP
//
//  Created by 나리강 on 2022/11/15.
//

import UIKit

class Transition {
    
    static func transitionVC(firstVC : UIViewController, secondVC : UIViewController) {
       
        firstVC.navigationController?.pushViewController(secondVC, animated: true)
    }
 
}
