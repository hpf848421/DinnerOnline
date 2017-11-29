//
//  HPPop_eventTableViewCell.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/28.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class HPPop_eventTableViewCell: UITableViewCell {

    @IBOutlet weak var popView: Pop_recipe_View!
    
    func setFirstLabel(with text1:String,second text2:String,first ImageURL1:String?,second ImageURL2:String?) -> () {
        
        popView.setFirstLabel(with: text1, second: text2, first: ImageURL1 ,second: ImageURL2)
        
    }
    
}
