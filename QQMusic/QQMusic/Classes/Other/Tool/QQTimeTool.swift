
//
//  QQTimeTool.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/13.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit

class QQTimeTool: NSObject {

    class func getFormatTime(timeInterval : TimeInterval) -> String{
        // timeInterval 21.123
        let min = Int(timeInterval) / 60
        let sec =  Int(timeInterval) % 60
        
        return String(format: "%02d:%02d", min,sec)
    }
    
}
