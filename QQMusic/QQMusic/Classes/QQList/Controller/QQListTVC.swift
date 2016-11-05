//
//  QQListTVC.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/4.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit

class QQListTVC: UITableViewController {

    var musicModels: [QQMusicModel] = [QQMusicModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 界面处理
        setupInit()
        
        QQMusicDataTool.getMusicModels { (models:[QQMusicModel]) in
            self.musicModels = models
            QQMusicOperationTool.shareInstance.musicModels = models;
        }
    }
}


// MARK:- 数据显示
extension QQListTVC{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = QQMusicCell.cellWithTableView(tableView: tableView)
        
        // 取出数据模型，给cell赋值
        let model = musicModels[indexPath.row]
        cell.musicM = model
        
        // 在这里，做一些特殊动画
        cell.animation(type: .Rotation)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = musicModels[indexPath.row]
        
        QQMusicOperationTool.shareInstance.playMusic(musicM: model)
        
        self.performSegue(withIdentifier: "listToDetail", sender: nil)
    }
}

// MARK:- 界面处理
extension QQListTVC{

    // 界面处理的总入口
    func setupInit() -> (){
        setTableView()
    }
    
    func setTableView() -> (){
        let imageView = UIImageView(image: UIImage(named: "QQListBack.jpg"))
        tableView.backgroundView = imageView
        
        tableView.rowHeight = 60;
        
        tableView.separatorStyle = .none;
        
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
