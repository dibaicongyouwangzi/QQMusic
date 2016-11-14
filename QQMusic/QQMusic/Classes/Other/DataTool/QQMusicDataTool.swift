
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
    
    
    
    class func getLrcMs(lrcName: String?) -> [QQLrcModel]{
        if lrcName == nil{
            return [QQLrcModel]()
        }
        
        // 1.获取文件的路径
        guard let path = Bundle.main.path(forResource: lrcName, ofType: nil) else{
            return [QQLrcModel]()
        }
        
        // 2.读取文件的内容
        var lrcContent = ""
        do{
            lrcContent = try String(contentsOfFile: path)
        }catch{
            print(error)
            return [QQLrcModel]()
        }
        
        // 3.解析字符串（转换成为QQLrcModel 组成的数组）
        let timeContentArray = lrcContent.components(separatedBy: "\n")
        
      
        var resultMs = [QQLrcModel]()
 
        for timeContentStr in timeContentArray{
            
            // [00:00.89] 传奇
            // [ti:]、[ti:瓦解]
        
            // 过滤垃圾数据
            if timeContentStr.contains("[ti:") ||
               timeContentStr.contains("[ar:") ||
               timeContentStr.contains("[al:")  {
            
                continue
            }
            
            // 在这里，可以拿到真正对的格式的数据
            // [00:00.89]传奇
            // 去掉左括号
            let resultLrcStr = timeContentStr.replacingOccurrences(of:"[", with:"")
            
            // 00:00.89]简单爱 
            let timeAndContent = resultLrcStr.components(separatedBy:"]")
            
            if timeAndContent.count != 2 {
                continue
            }
            let time = timeAndContent[0]
            let content = timeAndContent[1]
            
            // 创建歌词数据模型，赋值
            let lrcM = QQLrcModel()
            resultMs.append(lrcM)
            lrcM.beginTime = QQTimeTool.getTimeInterval(formatTime: time)
            lrcM.lrcContent = content
        }
        
        let count = resultMs.count

        for i in 0..<count{
            if i == count - 1{
                continue
            }
            let lrcM = resultMs[i]
            let nextLrcM = resultMs[i + 1]
            lrcM.endTime = nextLrcM.beginTime
        }
        
        // 4.返回结果
        return resultMs
    }
    
}
