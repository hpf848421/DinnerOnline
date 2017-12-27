//
//  HPTitleNavigationBar.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/12/14.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit
protocol  HPTitleNavigationBarDelegate:NSObjectProtocol{
    func backClick();
}
class HPTitleNavigationBar: UINavigationBar {
    var delegate1: HPTitleNavigationBarDelegate?
    var titlelabel : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        barTintColor=UIColor.white
        isTranslucent=false
        let navigationItem=UINavigationItem()
        let backButton=UIBarButtonItem(image: UIImage(named: "backStretchBackgroundNormal_22x22_"), style: .done, target: self, action: #selector(backClick))
        navigationItem.leftBarButtonItem=backButton
        
      
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
//        titleLabel.text="菜篮子"
        titleLabel.textAlignment=NSTextAlignment.center
        navigationItem.titleView=titleLabel
        navigationItem.titleView?.backgroundColor=UIColor.white
          setItems([navigationItem], animated: false)
        titlelabel=titleLabel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
extension HPTitleNavigationBar{
    
    @objc func backClick(){
        delegate1?.backClick()
        
    }
    
}
