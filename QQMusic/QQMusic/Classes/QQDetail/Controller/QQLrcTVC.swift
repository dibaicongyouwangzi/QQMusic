


//
//  QQLrcTVC.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/14.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit

class QQLrcTVC: UITableViewController {

    
    var scrollRow = 0{
        didSet{
            if scrollRow == oldValue{
                return
            }
            
            let indexPath = NSIndexPath(row: scrollRow, section: 0)
            tableView.scrollToRow(at: indexPath as IndexPath, at: UITableViewScrollPosition.middle, animated: true)
        }
    }
    
    
    var lrcMs : [QQLrcModel] = [QQLrcModel]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.contentInset = UIEdgeInsetsMake(tableView.frame.size.height * 0.5, 0, tableView.frame.size.height * 0.5, 0)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lrcMs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "lrc"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        
        // 设置cell的基本界面
            cell?.backgroundColor = UIColor.clear
            cell?.textLabel?.textAlignment = .center
            cell?.textLabel?.textColor = UIColor.white
        }
        
        let model = lrcMs[indexPath.row]
        
        cell?.textLabel?.text = model.lrcContent
        
        return cell!
    }
    
}
