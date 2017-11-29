//
//  HPMainBannerCell.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/27.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class HPMainBannerCell: UICollectionViewCell {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var desLabel: UILabel!
    
    var celldata : Any?{
        didSet{
            guard let model=celldata else{
                
                return
            }
            let dic = model as! NSDictionary
            let name = dic["name"] as! NSString
            let dishes = dic["dishes"] as! NSDictionary
            let dishesArray=dishes["dishes"] as! NSArray
            let thumb=dishesArray[0] as! NSDictionary
            let thumbnail_280=thumb["thumbnail_280"] as! String
            if let leftImageView = leftImageView  {
                if name.contains("早餐") {
                    
                    leftImageView.image=UIImage(named: "themeSmallPicForBreakfast_375x100_.png")
                    desLabel.text="一 早餐 一"
                }
                if name.contains("午餐") {
                      leftImageView.image=UIImage(named: "themeSmallPicForLaunch_375x100_.png")
                    desLabel.text="一 午餐 一"
                }
                if name.contains("晚餐") {
                    desLabel.text="一 晚餐 一"
                      leftImageView.image=UIImage(named: "themeSmallPicForSupper_375x100_.png")
                }
            }
            
            if let rightImageView = rightImageView {
                rightImageView.sd_setImage(with: URL(string: thumbnail_280))
            }
            
            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
 
}
