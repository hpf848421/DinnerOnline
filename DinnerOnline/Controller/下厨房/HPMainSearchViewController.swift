//
//  HPMainSearchViewController.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/30.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class HPMainSearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.white
        setUI()
    }
    func setUI() {
        let searchBar=UISearchBar(frame: CGRect(x: 10, y: 20, width: UIScreen.kWidth()-60, height: 40))
        view.addSubview(searchBar)
        searchBar.placeholder="搜索菜谱、食材"
        searchBar.searchBarStyle=UISearchBarStyle.minimal
        searchBar.barTintColor=UIColor.lightGray
        searchBar.tintColor=UIColor.lightGray
    
       
        let cancelButton = UIButton(frame: CGRect(x: UIScreen.kWidth()-50, y: 25, width: 40, height: 30))
        view.addSubview(cancelButton)
        cancelButton.setTitle("取消", for: UIControlState.normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonClick), for: UIControlEvents.touchUpInside)
        
    
    }

    @objc func cancelButtonClick(){
        dismiss(animated: false, completion: nil)
        
    }

}
