//
//  Reusable.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit

class Reusable {
    static func tableID(cell : UITableViewCell) -> String {
       var id = String(describing: cell.self)
        return id
    }
    
    static func collectionID(cell : UICollectionViewCell) -> String {
        var id = String(describing: cell.self)
         return id
        
    }
    
}
