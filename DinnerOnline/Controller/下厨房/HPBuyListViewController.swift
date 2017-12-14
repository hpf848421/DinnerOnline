//
//  HPBuyListViewController.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/12/14.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class HPBuyListViewController: UIViewController {
    
    lazy  var navigationBar1 = HPTitleNavigationBar(frame: CGRect(x: 0, y: 20, width: UIScreen.kWidth(), height: barHeight))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.white
        navigationBar1.delegate1=self
        view.addSubview(navigationBar1)
        
        
        
    }


}
extension HPBuyListViewController:HPTitleNavigationBarDelegate{
    func backClick() {
            self.navigationController?.popViewController(animated: true)
    }
    
    
}
