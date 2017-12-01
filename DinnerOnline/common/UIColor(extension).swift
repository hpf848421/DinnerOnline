//
//  UIColor(extension).swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/30.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit
extension UIColor {
   
    convenience init(displayHelperWithRed:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat) {
        self.init(displayP3Red: displayHelperWithRed/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
        
    }
  
    
}
