//
//  QQDetailVC.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/4.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit

// MARK:- 存放属性
class QQDetailVC: UIViewController {

    @IBOutlet weak var lrcScrollView: UIScrollView!
    
    // 歌词的视图
    var lrcView: UIView?
    
    
    // 分析界面，根据不同的更新频率，采用不同的方案赋值
    /** 歌词动画背景 1 */
    @IBOutlet weak var foreImageView: UIImageView!
    /** 背景图片 1 */
    @IBOutlet weak var backImageView: UIImageView!
    /** 歌曲名称 1 */
    @IBOutlet weak var songNameLabel: UILabel!
    /** 歌手名称 1 */
    @IBOutlet weak var singNameLabel: UILabel!
    /** 总时长 1 */
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    /** 歌词label n */
    @IBOutlet weak var lrclabel: UILabel!
    /** 已经播放时长 n */
    @IBOutlet weak var costTimeLabel: UILabel!
    /** 进度条 n */
    @IBOutlet weak var progressSlider: UISlider!
    
   
    @IBAction func close() {
    }
    @IBAction func playOrPause(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected{
            QQMusicOperationTool.shareInstance.pauseCurrentMusic()
        }else{
            QQMusicOperationTool.shareInstance.playCurrentMusic()
        }
    }
    @IBAction func preMusic() {
        setupOnce()
        
        QQMusicOperationTool.shareInstance.preMusic()
    }
    @IBAction func nextMusic() {
        setupOnce()
        
        QQMusicOperationTool.shareInstance.nextMusic()
    }
    
    // 负责更新很多次的timer
    var timer: Timer?
}

// MARK:- 业务逻辑
extension QQDetailVC {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupOnce()
        
        addTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removerTimer()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLrcView()
        setupLrcScrollView()
        setSlider()
    }
    
    
    func setupOnce() -> (){
        foreImageView.image = nil
        /** 背景图片 1 */
        backImageView = nil
        /** 歌曲名称 1 */
        songNameLabel.text = ""
        /** 歌手名称 1 */
        singNameLabel.text = ""
        /** 总时长 1 */
        totalTimeLabel.text = ""
    }
    
    func setupTimes() -> (){
        /** 歌词label n */
        lrclabel.text = ""
        /** 已经播放时长 n */
        costTimeLabel.text = ""
        /** 进度条 n */
        progressSlider.value = 0
    }
    
    
    func addTimer() -> (){
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(QQDetailVC.setupTimes), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .commonModes)
    }
    
    func removerTimer() -> (){
        timer?.invalidate()
        timer = nil
    }
    
}

// MARK:- 界面操作
extension QQDetailVC {

    // 添加歌词视图
    func addLrcView() -> (){
        lrcView = UIView()
        lrcView?.backgroundColor = UIColor.clear
        lrcScrollView.addSubview(lrcView!)
    }
    
    // 调整frame
    func setLrcViewFrame() -> (){
        lrcView?.frame = lrcScrollView.bounds
        lrcView?.frame.origin.x = lrcScrollView.frame.size.width
        lrcScrollView.contentSize = CGSize(width: lrcScrollView.frame.size.width * 2, height: 0)
    }
    
    func setSlider() -> (){
        progressSlider.setThumbImage(UIImage(named:"player_slider_playback_thumb"), for: .normal)
    }
    
    func setupForeImageView() -> (){
        foreImageView.layer.cornerRadius = foreImageView.frame.size.width / 2
        foreImageView.layer.masksToBounds = true
    }
    
    func setupLrcScrollView() -> (){
        lrcScrollView.delegate = self
        lrcScrollView.isPagingEnabled = true
        lrcScrollView.showsHorizontalScrollIndicator = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setLrcViewFrame()
        setupForeImageView()
    }
}


// MARK:- 做动画
extension QQDetailVC: UIScrollViewDelegate{
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        print(x)
        
        let radio = 1 - x / scrollView.frame.size.width
        
        foreImageView.alpha = radio
        lrclabel.alpha = radio
    }
}








