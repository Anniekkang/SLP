//
//  TableViewExtension.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit

extension ManageMyPageViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return 5
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.id, for: indexPath) as? ImageTableViewCell else { return UITableViewCell() }
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpandableCardTableViewCell.id, for: indexPath) as? ExpandableCardTableViewCell else { return UITableViewCell() }
            if isOpen == false {
                cell.isHidden = true
    
            } else {
                cell.isHidden = false
            }
            
            return cell
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ManageMyPageCell.id, for: indexPath) as? ManageMyPageCell else { return UITableViewCell() }
            cell.label.text = MyPageData.sectionThreeArray[indexPath.row]
            return cell
        default:
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           
        if section == 1 {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderCell") as? HeaderCell else { return UIView() }
           
            headerView.delegate = self
            
            
            return headerView
            
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 {
            return 50
        } else if indexPath.section == 1 {
            if isOpen {
                return UITableView.automaticDimension
            } else {
                return 0
            }
            
        }
        else {
            return UITableView.automaticDimension
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return tableView.frame.size.width * 0.17
        } else {
            return 0
        }
    }
}