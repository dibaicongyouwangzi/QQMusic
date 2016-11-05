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
    
    @IBOutlet weak var foreImageView: UIImageView!
    
    @IBOutlet weak var lrclabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
}

// MARK:- 业务逻辑
extension QQDetailVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLrcView()
        setupLrcScrollView()
        setSlider()
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








