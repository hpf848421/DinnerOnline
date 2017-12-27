//
//  CircleIconView.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/12/15.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class CircleIconView: UIImageView {
    
    override func awakeFromNib() {
        self.layer.cornerRadius=self.Width*0.5
        self.clipsToBounds=true
    }

}
