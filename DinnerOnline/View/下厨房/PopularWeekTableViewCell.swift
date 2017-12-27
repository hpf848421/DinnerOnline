//
//  PopularWeekTableViewCell.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/12/15.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class PopularWeekTableViewCell: UITableViewCell {

    @IBOutlet weak var imageView1: UIImageView!
    
    
    @IBOutlet weak var titleView: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var tuiguangLabel: UILabel!
    
    
    
    @IBOutlet weak var icon: CircleIconView!
    
    
    @IBOutlet weak var nickName: UILabel!
    
    func setDatas(_ data:NSDictionary?) {
        guard   let data=data,
            let recipe=data["recipe"] as? NSDictionary,
                let stats=recipe["stats"] as? NSDictionary
            else {
            return
        }
        titleView.text=recipe["name"] as? String
        let n_cooked = stats["n_cooked"] as? String
        let score=recipe["score"] as? String
        
        imageView1.sd_setImage(with: URL(string: (recipe["photo"] as? String)!))
         countLabel.text=String(format: "%@分 %@人做过", score ?? "",n_cooked ?? "")
        guard let reason=data["reason"] as? String else{
            
            return
        }
        
        if reason == "推广" {
            tuiguangLabel.isHidden=false
        }else{
            tuiguangLabel.isHidden=true
        }
        
        guard   let author = recipe["author"] as? NSDictionary else{
            
            return
        }
        let name1=author["name"] as? String
        let photo60 = author["photo60"] as? String
        icon.sd_setImage(with: URL(string: photo60!))
        nickName.text=name1
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle=UITableViewCellSelectionStyle.none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
