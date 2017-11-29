//
//  UIScreen(addtion).swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/23.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit
extension UIScreen{
    
    class func kWidth() -> (CGFloat) {
        
        return UIScreen.main.bounds.size.width
    }
    class func kHeight()  -> (CGFloat)  {
        
        return UIScreen.main.bounds.size.height
    }
}
