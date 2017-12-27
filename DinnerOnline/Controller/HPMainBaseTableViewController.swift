//
//  HPMainBaseTableViewController.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/12/15.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class HPMainBaseTableViewController: PopTitleBaseViewController {

    lazy var tableView : UITableView = {
        
        let tableV = UITableView(frame: CGRect(x: 0, y: 20, width: UIScreen.kWidth(), height: UIScreen.kHeight() - 20), style: UITableViewStyle.plain)
        tableV.delegate=self
        tableV.allowsSelection=false
        tableV.dataSource=self
        tableV.contentInset=UIEdgeInsetsMake(44, 0, 0, 0)
        tableV.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "ReuseIdentifier")
        return tableV
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.insertSubview(tableView, belowSubview: navigationBar1)
    }

}
extension HPMainBaseTableViewController:UITableViewDelegate,UITableViewDataSource{
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseIdentifier", for: indexPath)
        
        
        
        return cell
    }
    
}
