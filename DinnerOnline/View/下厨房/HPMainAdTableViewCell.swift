//
//  HPMainAdTableViewCell.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/30.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class HPMainAdTableViewCell: UITableViewCell {

    @IBOutlet weak var adimageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var adButton: AdArrowDownButton!
    
    var celldatas : NSDictionary? {
        didSet{
            
            guard let celldatas=celldatas else{
                
                return
                
            }
            
            let portals = celldatas["portals"] as? NSArray

            let portal = portals?[0] as? NSDictionary
            let objDic = portal?["object"] as? NSDictionary
            let ad_info = objDic?["ad_info"] as? NSDictionary
            let title_1st = ad_info?["title_1st"] as? String
            let pic_url = ad_info?["pic_url"] as? String
            let labelDec = ad_info?["label"] as? String
            titleLabel.text=title_1st
            adButton.setTitle(labelDec, for: UIControlState.normal)
            guard let pic_url1=pic_url else {
                return
            }
            
            adButton.setImage(UIImage(named: "arrowDown_22x22_"), for: UIControlState.normal)
            adimageView.sd_setImage(with: URL(string: pic_url1), placeholderImage: UIImage(named: "feedsNotLogin_320x240_"))
            
        }
        
        
    }
    
    
    @IBAction func adBtnClick(_ sender: Any) {
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
