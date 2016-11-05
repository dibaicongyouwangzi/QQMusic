//
//  QQMusicOperationTool.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/5.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit

class QQMusicOperationTool: NSObject {

    var currentPlayIndex = -1{
        didSet{
            if currentPlayIndex < 0{
                currentPlayIndex = musicModels.count - 1
            }
            
            if currentPlayIndex > musicModels.count - 1{
                currentPlayIndex = 0
            }
        }
    }
    
    static let shareInstance = QQMusicOperationTool()
    
    let tool: QQMusicTool = QQMusicTool()
    
    // 播放的音乐列表
    var musicModels:[QQMusicModel] = [QQMusicModel]()
    
    func playMusic(musicM: QQMusicModel){
        // 播放数据模型对应的音乐
        tool.playMusic(musicName: musicM.filename!)
        currentPlayIndex = musicModels.index(of: musicM)!
    }
    
    func pauseCurrentMusic() -> (){
        
        tool.pauseMusic()
    }
    
    func nextMusic() -> (){
        currentPlayIndex += 1
        
        // 取出需要播放的音乐数据模型
        let model = musicModels[currentPlayIndex]
        
        // 根据音乐模型，进行播放
        playMusic(musicM: model)
    }
    
    func preMusic() -> (){
        currentPlayIndex -= 1
        
        // 取出需要播放的音乐数据模型
        let model = musicModels[currentPlayIndex]
        
        // 根据音乐模型，进行播放
        playMusic(musicM: model)
    }
    
    
    func playCurrentMusic() -> (){
        // 取出需要播放的音乐数据模型
        let model = musicModels[currentPlayIndex]
        
        // 播放音乐模型
        playMusic(musicM: model)
    }
}
