


//
//  QQLrcTVC.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/14.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit

class QQLrcTVC: UITableViewController {

    // 提供给外界赋值的进度
    var progress : CGFloat = 0{
        didSet{
            // 拿到当前正在播放的cell
            let indexPath = NSIndexPath(row: scrollRow, section: 0)
            let cell = tableView.cellForRow(at: indexPath as IndexPath) as? QQLrcCell
            
            // 给cell里面的label的进度赋值
            cell?.progress = progress
        }
    
    }
    
    
    // 提供给外界的数值，代表需要滚动的行数
    var scrollRow = -1{
        didSet{
            // 过滤值，降低滚动频率
            // 如果两个值相等，代表滚动的是同一行，没有必要滚动很多次
            if scrollRow == oldValue{
                return
            }
            
            let indexPaths = tableView.indexPathsForVisibleRows
            tableView.reloadRows(at: indexPaths!, with: .fade)
            
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
        
        let cell = QQLrcCell.cellWithTableView(tableView: tableView)
        
        // 取出歌词模型
        let model = lrcMs[indexPath.row]
        
        if indexPath.row == scrollRow{
            cell.progress = progress
        }else{
            cell.progress = 0
        }
        
        cell.lrcContent = model.lrcContent
        
        return cell
    }
    
}
