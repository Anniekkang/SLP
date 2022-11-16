//
//  SwizzlingExtension.swift
//  SLP
//
//  Created by 나리강 on 2022/11/17.
//

import UIKit

extension UIViewController {
    
   
    
    // 커뮤니케이션, 디버깅할 때 원하는 함수로 바꿔주는
    // class와 static의 차이 -> 상속 받아서 메서드를 override할 때
    // 구조체 싱글턴, 클래스 싱글턴 차이 => 찾아보기
    class func swizzleMethod() {
        
        let origin = #selector(viewWillAppear)
        let change = #selector(changeViewWillAppear)
        
        guard let originMethod = class_getInstanceMethod(UIViewController.self, origin), let changedMethod = class_getInstanceMethod(UIViewController.self, change) else
        {
            print("함수를 찾을 수 없거나 오류 발생")
            return
            
        }
        
        method_exchangeImplementations(originMethod, changedMethod)
            
    }
    
    @objc func changeViewWillAppear() {
        print("Change ViewWillAppear SUCCEED")
    }
    
}

