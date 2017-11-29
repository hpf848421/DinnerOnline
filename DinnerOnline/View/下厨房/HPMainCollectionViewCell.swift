//
//  HPMainCollectionViewCell.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/28.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class HPMainCollectionViewCell: UICollectionViewCell {

    
    var CellW :CGFloat = 185.0
    
    @IBOutlet weak var imageView: UIImageView!
    //描述
    @IBOutlet weak var descLabel: UILabel!
    //参与人
    @IBOutlet weak var countLabel: UILabel!
    //昵称
    @IBOutlet weak var nickLabel: UILabel!
    //职业 讲师
    @IBOutlet weak var typeLabel: UILabel!
    //
    @IBOutlet weak var nickConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var countHeight: NSLayoutConstraint!
    
    @IBOutlet weak var desHConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var typeWidthConstraint: NSLayoutConstraint!
    var tabId : String?
    
    var tabWH : CGFloat = 0
    
    var portals : NSDictionary? {
        didSet{
            guard let portals=portals  else {
                return
            }
             countHeight.constant=20
             desHConstraint.constant=30
            //厨房studio课堂
            if tabId == "2" {
                //职业
                let labelStr = portals["label"] as? String
                let objectDic = portals["object"] as? NSDictionary
                //描述
                let descname = objectDic?["name"] as? String
                let lecturerDic =  objectDic?["lecturer"] as? NSDictionary
                //昵称
                let nickname =  lecturerDic?["name"] as? String
                
                let nickStr = labelStr as NSString?
                
                //职业
                let sizeW=nickStr?.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 20), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 15)], context: nil).size.width ?? 0
                //描述
                 let descnameH=descname?.boundingRect(with: CGSize(width: CellW , height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 17)], context: nil).size.height ?? 0
                if descnameH > 30 {
                    desHConstraint.constant=50
                    
                }
                  typeWidthConstraint.constant=sizeW+2
                
                let images =  objectDic?["image"] as? NSDictionary
                
                 let total_sales_volume =  objectDic?["total_sales_volume"] as? Int64
                
                typeLabel.text=labelStr
                nickLabel.text=nickname
                descLabel.text=descname
                countLabel.text=String.init(format: "%@人参与", total_sales_volume?.description ?? "0")
                
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
            //电子书专栏
            if tabId == "25" || tabId == "28" || tabId == "3"{
                //职业
                let labelStr = portals["label"] as? String
                let objectDic = portals["object"] as? NSDictionary
                //描述
                let title_2nd = objectDic?["title_2nd"] as? String
                let title_1st = objectDic?["title_1st"] as? String

                let images =  objectDic?["image"] as? NSDictionary
      
                let nickStr = labelStr as NSString?
                let sizeW=nickStr?.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 20), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 15)], context: nil).size.width ?? 0
                
                //描述
                let descnameH=title_1st?.boundingRect(with: CGSize(width: CellW , height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 17)], context: nil).size.height ?? 0
                if descnameH > 30 {
                    desHConstraint.constant=50
                    
                }
                if tabId == "3" {
                    nickConstraint.constant = 0
                    
                }else{
                    nickConstraint.constant = 21
                }
                
                countHeight.constant=0
                typeWidthConstraint.constant=sizeW+2
                typeLabel.text=labelStr
                nickLabel.text=title_2nd
                descLabel.text=title_1st
    
                
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
            //厨房活动
            if tabId == "4" {
                //职业
                let labelStr = portals["label"] as? String
                let objectDic = portals["object"] as? NSDictionary
                //描述
                let title_2nd = objectDic?["title_2nd"] as? String
                let title_1st = objectDic?["title_1st"] as? String
                
                let images =  objectDic?["image"] as? NSDictionary
                
                let nickStr = labelStr as NSString?
                let sizeW=nickStr?.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 20), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 15)], context: nil).size.width ?? 0
                //描述
                let descnameH=title_1st?.boundingRect(with: CGSize(width: CellW , height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 17)], context: nil).size.height ?? 0
                if descnameH > 30 {
                    desHConstraint.constant=50
                    
                }
                typeWidthConstraint.constant=sizeW+2
                countHeight.constant=0
                typeLabel.text=labelStr
                nickLabel.text=title_2nd
                descLabel.text=title_1st
                
                
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
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        typeLabel.layer.cornerRadius=5
        
    }

}
