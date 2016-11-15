//
//  QQLrcCell.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/16.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit

class QQLrcCell: UITableViewCell {

    @IBOutlet weak var lrcLabel: QQLrcLabel!
    
    
    var progress : CGFloat = 0{
        didSet{
            lrcLabel.radio = progress
        }
    }
    
    var lrcContent :String = ""{
        didSet{
            lrcLabel.text = lrcContent
        }
    }
    
    class func cellWithTableView(tableView: UITableView) -> QQLrcCell{
    
        let cellID = "lrc"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? QQLrcCell
        if cell == nil{
            cell = Bundle.main.loadNibNamed("QQLrcCell", owner: nil, options: nil)?.first as? QQLrcCell
        }
        
        return cell!
    }
}
