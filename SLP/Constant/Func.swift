//
//  Func.swift
//  SLP
//
//  Created by 나리강 on 2022/11/15.
//

import UIKit

class Func {
    
    static func buttonTapped(firstVC : UIViewController, secondVC : UIViewController) {
       
        firstVC.navigationController?.pushViewController(secondVC, animated: true)
    }
}
