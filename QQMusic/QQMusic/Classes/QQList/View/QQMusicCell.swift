
//
//  QQMusicCell.swift
//  QQMusic
//
//  Created by 迪拜葱油王子 on 2016/11/5.
//  Copyright © 2016年 迪拜葱油王子. All rights reserved.
//

import UIKit

enum AnimationType{

    case Rotation
    case Transition
    case Scale
}

class QQMusicCell: UITableViewCell {

    var musicM: QQMusicModel?{
        didSet{
            singerIconImageView.image = UIImage(named: (musicM?.singerIcon)!)
            songNameLabel.text = musicM?.name
            singerNameLabel.text = musicM?.singer
        }
    }
    
    @IBOutlet weak var singerIconImageView: UIImageView!
    
    @IBOutlet weak var songNameLabel: UILabel!
    
    @IBOutlet weak var singerNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        singerIconImageView.layer.cornerRadius = singerIconImageView.frame.size.width * 0.5
        singerIconImageView.layer.masksToBounds = true
    }
    
    
    class func cellWithTableView(tableView: UITableView) -> QQMusicCell{
    
        let cellID = "music"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil{
            cell = Bundle.main.loadNibNamed("QQMusicCell", owner: nil, options: nil)?.first as? QQMusicCell
        }
        return cell as! QQMusicCell
    }
    
    
    func animation(type: AnimationType) -> (){
        
        if type == .Rotation{
            self.layer.removeAnimation(forKey: "rotation")
            let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
            animation.values = [-1/30 * M_PI, 0, 1/30 * M_PI, 0]
            animation.duration = 0.35
            animation.repeatCount = 2
            self.layer.add(animation, forKey: "rotation")
        }
        if type == .Scale{
            self.layer.removeAnimation(forKey: "scale")
            let animation = CAKeyframeAnimation(keyPath: "transform.scale.x")
            animation.values = [0.5, 1, 0.5, 1]
            animation.duration = 0.2
            animation.repeatCount = 2
            self.layer.add(animation, forKey: "scale")
        }
        if type == .Transition{
        
        }
        
    }
    
}
