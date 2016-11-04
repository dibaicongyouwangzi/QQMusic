//
//  QQMusicOperationTool.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/5.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit

class QQMusicOperationTool: NSObject {

    static let shareInstance = QQMusicOperationTool()
    
    let tool: QQMusicTool = QQMusicTool()
    
    func playMusic(musicM: QQMusicModel){
        
        tool.playMusic(musicName: musicM.filename!)
    }
    
}
