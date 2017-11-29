//
//  HPTitleBarView.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/23.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit
class HPTitleBarView: UIView {
    var buttonArray : [HPTitleButton] = [HPTitleButton]()
    var bardatas : [HPNavTitleModel]? {
        didSet{
            for (index1,button) in buttonArray.enumerated() {
                guard let bardatas=bardatas else{
                    
                  return
                }
                if bardatas.count>0 {
                     let titleModel = bardatas[index1]
                    
                    button.sd_setImage(with: URL(string: titleModel.picurl!), for: UIControlState.normal)
                      button.setTitle(bardatas[index1].name, for: UIControlState.normal)
                }
               
              
            }
        }
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        let startMargin :CGFloat = 10.0
        let cellMargin :CGFloat = 15.0
        let buttonWidth = (UIScreen.kWidth() - 3*cellMargin - 2*startMargin)*0.25
        for index in 0..<4 {
            let titleBtn=HPTitleButton(frame: CGRect(x: startMargin + (CGFloat(index) * (buttonWidth+cellMargin)), y: 0, width: buttonWidth, height: 80))
            titleBtn.tag=index
            titleBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
            titleBtn.titleLabel?.font=UIFont.systemFont(ofSize: 12)
            titleBtn.imageView?.contentMode=UIViewContentMode.scaleAspectFit
            titleBtn.titleLabel?.textAlignment=NSTextAlignment.center
            addSubview(titleBtn)
            buttonArray.append(titleBtn)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
