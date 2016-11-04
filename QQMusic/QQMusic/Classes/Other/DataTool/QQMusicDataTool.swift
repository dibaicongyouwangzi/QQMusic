
//
//  QQMusicDataTool.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/4.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit

class QQMusicDataTool: NSObject {

    class func getMusicModels(result:([QQMusicModel])->()){
    
        // 解析歌曲信息
        
        // 1. 获取文件路径
        guard let path = Bundle.main.path(forResource: "Musics.plist", ofType: nil) else {
            result([QQMusicModel]())
            return
        }
        
        // 2. 读取文件内容
        guard let array = NSArray(contentsOfFile: path) else{
            result([QQMusicModel]())
            return
        }
        
        // 3. 解析：转换成歌曲模型
        var models = [QQMusicModel]()
        for dic in array{
            let model = QQMusicModel(dic: dic as! [String : AnyObject])
            models.append(model)
        }
        
        // 4.返回结果
        result(models)
    }
}
