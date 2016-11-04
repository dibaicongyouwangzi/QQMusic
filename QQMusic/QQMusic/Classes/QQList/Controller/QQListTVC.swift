//
//  QQListTVC.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/4.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit

class QQListTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        QQMusicDataTool.getMusicModels { (models:[QQMusicModel]) in
            print(models)
        }
    }
}
