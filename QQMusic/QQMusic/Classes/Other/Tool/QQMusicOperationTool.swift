//
//  QQMusicOperationTool.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/5.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit
import MediaPlayer

class QQMusicOperationTool: NSObject {

    var artwork : MPMediaItemArtwork?
    
    var musicModel = QQMusicMessageModel()
    
    func getMusicMessageModel() -> QQMusicMessageModel{
        
        // 在这里，保持，数据的最新状态，就可以
        
        //当前正在播放的歌曲信息
        musicModel.musicM = musicModels[currentPlayIndex]
        
        musicModel.costTime = (tool.player?.currentTime)!
        musicModel.totalTime = (tool.player?.duration)!
        
        musicModel.isPlaying = (tool.player?.isPlaying)!
        
        return musicModel
    }
    
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
    
    func setupLockMessage() -> (){
        
        // 取出需要展示的数据模型
        let musicMessageM = getMusicMessageModel()
        
        // 1. 获取锁屏中心
        let center = MPNowPlayingInfoCenter.default()
        
        // 2. 给锁屏中心赋值
        
        let musicName = musicMessageM.musicM?.name ?? ""
        let singerName = musicMessageM.musicM?.singer ?? ""
        let totalTime = musicMessageM.totalTime
        let costTime = musicMessageM.costTime
        
        let imageName = musicMessageM.musicM?.icon ?? ""
        let image = UIImage(named: imageName)
        
        // 1.获取到当前正在播放的歌词
        let lrcFileName = musicMessageM.musicM?.lrcname
        let  lrcMs = QQMusicDataTool.getLrcMs(lrcName: lrcFileName)
        
        let lrcM = QQMusicDataTool.getCurrentLrcM(currentTime: musicMessageM.costTime, lrcMs: lrcMs).lrcM
        // 2.绘制到图片，生成一个新的图片
        let resultImage = QQImageTool.getNewImage(sourceImage: image, str: lrcM?.lrcContent)
        
        // 3.绘制专辑他图片
        if image != nil{
            artwork = MPMediaItemArtwork(image: resultImage!)
        }
        
        let dic : NSMutableDictionary = [
            MPMediaItemPropertyAlbumTitle : musicName,
            MPMediaItemPropertyArtist : singerName,
            MPMediaItemPropertyPlaybackDuration : totalTime,
            MPNowPlayingInfoPropertyElapsedPlaybackTime : costTime,
        ]
        
        if artwork != nil {
            dic.setValue(artwork!, forKey: MPMediaItemPropertyArtwork)
        }
        
        let dicCopy = dic.copy()
        
        center.nowPlayingInfo = dicCopy as? [String : AnyObject]
        
        // 3. 接收远程事件
        UIApplication.shared.beginReceivingRemoteControlEvents()
    }
    
}
