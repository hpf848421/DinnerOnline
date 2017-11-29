//
//  HPMainRecommendCollectionViewCell.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/29.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class HPMainRecommendCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var desLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    var tabId : String?
    
    var tabWH : CGFloat = 0
    
    var portals : NSDictionary? {
        didSet{
            guard let portals=portals  else {
                return
            }
            
            //职业
            let labelStr = portals["label"] as? String
            let objectDic = portals["object"] as? NSDictionary
            //描述
            let descname = objectDic?["name"] as? String
            let nrecipes =  objectDic?["nrecipes"] as? Int64
        
            
            let images =  objectDic?["image"] as? NSDictionary
   
            desLabel.text=descname
            countLabel.text=String.init(format: "%d道菜谱", nrecipes ?? 0)

            
            guard  let url_pattern =  images?["url_pattern"] as? NSString
                else{
                    return
            }
            
            let widthUrl=url_pattern.replacingCharacters(in:  url_pattern.range(of: "{width}"), with: "750") as NSString
            
            let height1 :CGFloat =  750.0/self.tabWH
            
            let heightUrl = widthUrl.replacingCharacters(in: widthUrl.range(of: "{height}"), with: String(format: "%.0f",height1)) as NSString
            let url1 = heightUrl.replacingCharacters(in: heightUrl.range(of: "{format}"), with:"webp") as String
            
            imageView.sd_setImage(with: URL(string: url1))
            
            
            
        }
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
