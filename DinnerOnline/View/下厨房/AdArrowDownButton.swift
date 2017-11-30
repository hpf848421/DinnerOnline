//
//  AdArrowDownButton.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/30.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class AdArrowDownButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        for subview in self.subviews {
            if subview.isKind(of: NSClassFromString("UIImageView")!){
                
                subview.frame=CGRect(x: frame.size.width-10, y: 0, width: 5, height: 5)
                subview.center.y=self.frame.size.height*0.5
            }
            if subview.isKind(of: NSClassFromString("UIButtonLabel")!){
                
                subview.frame=CGRect(x: 10, y: 0, width: 40, height:20)
                subview.center.y=self.frame.size.height*0.5
            }
            
        }
        
    }

}
