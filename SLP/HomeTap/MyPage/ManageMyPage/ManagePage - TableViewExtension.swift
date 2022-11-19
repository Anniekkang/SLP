//
//  TableViewExtension.swift
//  SLP
//
//  Created by 나리강 on 2022/11/19.
//

import UIKit

extension ManageMyPageViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MyPageData.pageArray.count + 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            if isOpen[section] {
                return 2
            } 
        } else if section == 5 {
            return 1
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ManageMyPageTableViewCell.id, for: indexPath) as? ManageMyPageTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let headerView = mainView.tableView.tableHeaderView {
                    let headerViewFrame = headerView.frame
                    let height = headerView.systemLayoutSizeFitting(headerViewFrame.size, withHorizontalFittingPriority: UILayoutPriority.defaultHigh, verticalFittingPriority: UILayoutPriority.defaultLow).height
                    var headerFrame = headerView.frame
                    if height != headerFrame.size.height {
                        headerFrame.size.height = height
                        headerView.frame = headerFrame
                        mainView.tableView.tableHeaderView = headerView
                    }
            headerView.translatesAutoresizingMaskIntoConstraints = true
                }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        if section == 0 {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FirstHeaderCell") as? FirstHeaderCell else { return UIView() }
            return headerView
            
        } else if section == 1 {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SecondHeaderCell") as? SecondHeaderCell else { return UIView() }
            headerView.sectionIndex = section
            return headerView
            
        } else {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "cellHeaderView") as? cellHeaderView else { return UIView() }
            
            return headerView
        }
    }
    
    
    
    
    
}
