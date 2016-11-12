//
//  CALayer+sz.swift
//  QQ音乐
//
//  Created by 大铲子 on 16/11/13.
//  Copyright © 2016年 大铲子. All rights reserved.
//

import UIKit

extension CALayer {

    // 暂停动画
    func pauseAnimate()
    {
        let pausedTime: CFTimeInterval = convertTime(CACurrentMediaTime(), from: nil)
        speed = 0.0;
        timeOffset = pausedTime;
    }

    // 恢复动画
    func resumeAnimate()
    {
        let pausedTime: CFTimeInterval = timeOffset
        speed = 1.0;
        timeOffset = 0.0;
        beginTime = 0.0;
        let timeSincePause: CFTimeInterval = convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        beginTime = timeSincePause;
    }


}
