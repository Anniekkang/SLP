//
//  TableViewExtension.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit

extension MyPageViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyPageData.listArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            buttonTapped()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NameTableViewCell.id, for: indexPath) as? NameTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageTableViewCell.id, for: indexPath) as? MyPageTableViewCell else { return UITableViewCell() }
            cell.iconImage.image = UIImage(named: MyPageData.listIconArray[indexPath.row] )
            cell.label.text = MyPageData.listArray[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
  
    }
                                  

}
