//
//  BaseNavigationController.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/23.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
      navigationBar.isHidden=true
        
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//        tabBarController.hidesBottomBarWhenPushed=true
        viewController.hidesBottomBarWhenPushed=true
//        tabBarController?.hidesBottomBarWhenPushed=true
        super.pushViewController(viewController, animated: animated)
        
    }


}
