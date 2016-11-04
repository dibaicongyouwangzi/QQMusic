
//
//  QQMusicTool.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/5.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit
import AVFoundation

class QQMusicTool: NSObject {
    
    var player:AVAudioPlayer?
    
    func playMusic(musicName: String){
    
        // 1. 获取需要播放的音乐文件路径
        guard let url = Bundle.main.url(forResource:musicName, withExtension: nil) else {return}
        
        if player?.url == url {
            player?.play()
            return
        }
        
        // 2. 根据路径创建一个播放器
        do{
            player = try AVAudioPlayer(contentsOf: url)
        }catch{
            print(error)
            return
        }
        
        // 3. 准备播放
        player?.prepareToPlay()
        
        // 4. 开始播放
        player?.play()
    }

}
