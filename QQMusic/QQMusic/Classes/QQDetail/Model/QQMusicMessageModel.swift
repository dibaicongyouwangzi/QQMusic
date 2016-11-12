

//
//  QQMusicMessageModel.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/13.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit

class QQMusicMessageModel: NSObject {

    var musicM : QQMusicModel?
    
    // 已经播放时间
    var costTime : TimeInterval = 0
    
    // 总时长
    var totalTime : TimeInterval = 0
    
    // 播放状态
    var isPlaying : Bool = false
}
