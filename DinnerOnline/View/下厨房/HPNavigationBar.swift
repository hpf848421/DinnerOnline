//
//  HPNavigationBar.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/23.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit
protocol HPNavigationBarDelegate : NSObjectProtocol {
    func searchBarClick(with bar : HPNavigationBar,and searchBar:UISearchBar)
}
class HPNavigationBar: UINavigationBar {
    
    var delegate1: HPNavigationBarDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        barTintColor=UIColor.white
        let createButton = UIButton(frame: CGRect(x: 10, y: 11, width: 22, height: 22))
        addSubview(createButton)
        createButton.setImage(UIImage(named: "creatrecipeicon_22x22_"), for: UIControlState.normal)
        
        let searchBar = UITextField(frame:  CGRect(x: createButton.frame.maxX+10, y: 5, width: UIScreen.kWidth()-44.0*2, height: 34))
        searchBar.addTarget(self, action: #selector(searchBarClick), for: UIControlEvents.editingDidBegin)
        
//        let searchBar=UISearchBar(frame: CGRect(x: createButton.frame.maxX+10, y: 5, width: UIScreen.kWidth()-44.0*2, height: 34))
        addSubview(searchBar)
        searchBar.placeholder="搜索菜谱、食材"
        
        let lanziButton = UIButton(frame: CGRect(x: UIScreen.kWidth()-32, y: 11, width: 22, height: 22))
        addSubview(lanziButton)
        lanziButton.setImage(UIImage(named: "buylistButtonImage_22x22_"), for: UIControlState.normal)
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
extension HPNavigationBar{
    
    @objc func searchBarClick(_ searchBar:UISearchBar){
        delegate1?.searchBarClick(with: self, and: searchBar)
    }
    
    
}
