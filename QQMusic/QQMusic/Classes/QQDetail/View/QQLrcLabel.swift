
//
//  QQLrcLabel.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/14.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit

class QQLrcLabel: UILabel {

    var radio : CGFloat = 0.0{
        didSet{
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // 设置一个颜色
        UIColor.yellow.set()
        
        let fillRect = CGRect(x: rect.origin.x, y: rect.origin.y, width:  rect.size.width * radio, height: rect.size.height)

        UIRectFillUsingBlendMode(fillRect, CGBlendMode.sourceIn)
    }
 

}
