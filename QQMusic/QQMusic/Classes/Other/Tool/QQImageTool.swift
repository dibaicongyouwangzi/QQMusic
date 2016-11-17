

//
//  QQImageTool.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/17.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit

class QQImageTool: NSObject {

    class func getNewImage(sourceImage: UIImage?, str: String?) -> UIImage?{
    
        // 0.容错处理
        guard let image = sourceImage else {return nil}
        guard let resultStr = str else {return image}
        
        // 1.开启图形上下文
        UIGraphicsBeginImageContext(image.size)
        
        // 2.绘制大图片
        image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        
        // 3.绘制文字
        let textRect = CGRect(x: 0, y: 0, width: image.size.width, height: 18)
        
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        let textDic = [
            NSForegroundColorAttributeName:UIColor.white,
            NSFontAttributeName : UIFont.systemFont(ofSize: 16),
            NSParagraphStyleAttributeName : style
        ]
        (resultStr as NSString).draw(in: textRect, withAttributes: textDic)
        
        // 4.取出图片
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 5.关闭图形上下文
        UIGraphicsEndImageContext()
        
        return resultImage
        
    }
    
}
