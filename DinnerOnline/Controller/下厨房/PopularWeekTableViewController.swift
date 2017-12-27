//
//  PopularWeekTableViewController.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/12/15.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class PopularWeekTableViewController: HPMainBaseTableViewController {
    lazy var hpMainViewModel = HPMainViewModel()
    let PopularWeekTableViewCellId="PopularWeekTableViewCellId"
    override func viewDidLoad() {
        super.viewDidLoad()
         setTitleStr(title: "本周流行菜谱")
        tableView.register(UINib(nibName: "PopularWeekTableViewCell", bundle: nil), forCellReuseIdentifier: PopularWeekTableViewCellId)
        hpMainViewModel.loadPopularDatas {[weak self] (result, content) in
           
                
            self?.tableView.reloadData()
            
        }
        
        
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hpMainViewModel.popularArray?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularWeekTableViewCellId, for: indexPath) as! PopularWeekTableViewCell

       cell.setDatas(hpMainViewModel.popularArray?[indexPath.row] as? NSDictionary)

        return cell
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }



}
