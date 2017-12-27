//
//  HPMainTitleBarTableViewCell.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/28.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit
protocol  HPMainTitleBarTableViewCellDelegate{
    func titleBarbtnClick(By tag:NSInteger,and model:HPNavTitleModel?)
    
}
class HPMainTitleBarTableViewCell: UITableViewCell {

    @IBOutlet weak var firstButton: HPTitleButton!
    
    
    @IBOutlet weak var secondButton: HPTitleButton!
    
    
    @IBOutlet weak var thirdButton: HPTitleButton!
    
    
    @IBOutlet weak var fourthButton: HPTitleButton!
    
    var delegate : HPMainTitleBarTableViewCellDelegate?
    
    private var buttonArray=[HPTitleButton]()
    
    var celldata : [HPNavTitleModel]?{
        didSet{
                guard  let celldata=celldata else {
                    return
                }
        
                 for (index1,button) in buttonArray.enumerated() {
                    if celldata.count>0 {
                        let titleModel = celldata[index1]
                        button.sd_setImage(with:  URL(string: titleModel.picurl!), for: .normal, placeholderImage: UIImage(named: "feedsNotLogin_320x240_"))
                        button.setTitleColor(UIColor.black, for: UIControlState.normal)
                        button.titleLabel?.font=UIFont.systemFont(ofSize: 12)
                        button.imageView?.contentMode=UIViewContentMode.scaleAspectFit
                        button.titleLabel?.textAlignment=NSTextAlignment.center
//                        button.sd_setImage(with:, for: UIControlState.normal)
                        button.setTitle(celldata[index1].name, for: UIControlState.normal)
                    }
                }
            }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonArray.append(firstButton)
        buttonArray.append(secondButton)
        buttonArray.append(thirdButton)
        buttonArray.append(fourthButton)
        
    }

    
    @IBAction func btnClick(_ sender: HPTitleButton) {
        
        delegate?.titleBarbtnClick(By: sender.tag, and: celldata?[sender.tag])
        
        
    }
    
}
