//
//  HPPop_eventTableViewCell.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/28.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit
@objc protocol HPPop_eventTableViewCellDelegate{
    
    @objc optional func imageClick(with view:Pop_recipe_View,and data:NSDictionary?,and button:UIButton,cell:HPPop_eventTableViewCell)
}
class HPPop_eventTableViewCell: UITableViewCell {

    @IBOutlet weak var popView: Pop_recipe_View!
    var delegate:HPPop_eventTableViewCellDelegate?
    
    func setFirstLabel(with text1:String,second text2:String,first ImageURL1:String?,second ImageURL2:String?) -> () {
        
        popView.setFirstLabel(with: text1, second: text2, first: ImageURL1 ,second: ImageURL2)
        
    }
    override func awakeFromNib() {
        popView.frame=CGRect(x: 0, y: 0, width: self.Width, height: self.height)
        popView.delegate=self
    }
}
extension HPPop_eventTableViewCell:Pop_recipe_ViewDelegate{
    
    func imageClick(with view: Pop_recipe_View, and data: NSDictionary?, and button: UIButton) {
        delegate?.imageClick?(with: view, and: data, and: button, cell: self)
    }
}
