//
//  HPTitleButton.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/23.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class HPTitleButton: UIButton {

  
    override func layoutSubviews() {
        super.layoutSubviews()
        for view1 in subviews {
            if view1.isKind(of: NSClassFromString("UIImageView")!){
                view1.frame=CGRect(x: 0, y: 10, width: 45, height: 45)
                view1.center.x=self.bounds.size.width*0.5
                
            }
            if view1.isKind(of: NSClassFromString("UIButtonLabel")!){
                view1.frame=CGRect(x: 0, y: 55, width: self.bounds.size.width, height: 20)
                view1.center.x=self.bounds.size.width*0.5
                
            }
            
        }
    }

}
