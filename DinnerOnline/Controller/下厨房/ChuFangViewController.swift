//
//  ChuFangViewController.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/23.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class ChuFangViewController: UIViewController {
    var HPMainTitleBarTableViewCellId:String = "HPMainTitleBarTableViewCell"
    var HPMainTableViewCellId:String = "HPMainTableViewCell"
    var HPPop_eventTableViewCellId:String = "HPPop_eventTableViewCellId"
    var HPBannerTableViewCellId:String = "HPBannerTableViewCellId"
    var HPMainAdTableViewCellId:String = "HPMainAdTableViewCellId"
    
    var pop_event_Count : Int = 0
    lazy var hpMainViewModel = HPMainViewModel()
    
    lazy  var navigationBar1 = HPNavigationBar(frame: CGRect(x: 0, y: 20, width: UIScreen.kWidth(), height: barHeight))
    
    lazy var titleBar = HPTitleBarView(frame: CGRect(x: 0, y: 0, width: UIScreen.kWidth(), height: 80))
    
    lazy var tableView : HPMainTableView = {
        let table = HPMainTableView()
        table.allowsSelection=false
        table.delegate=self
        table.dataSource=self
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        
        addTableView()
        
        loaddatas()
    }


}

// MARK: - UI
extension ChuFangViewController{
    func setNavigationBar(){
        self.navigationBar1.delegate1=self
        view.addSubview(navigationBar1)
    }

    func addTableView() {
        
        tableView.register(UINib(nibName: "HPMainTableViewCell", bundle: nil), forCellReuseIdentifier: HPMainTableViewCellId)
        tableView.register(UINib(nibName: "HPMainTitleBarTableViewCell", bundle: nil), forCellReuseIdentifier: HPMainTitleBarTableViewCellId)
        tableView.register(UINib(nibName: "HPPop_eventTableViewCell", bundle: nil), forCellReuseIdentifier: HPPop_eventTableViewCellId)
        tableView.register(UINib(nibName: "HPBannerTableViewCell", bundle: nil), forCellReuseIdentifier: HPBannerTableViewCellId)
        tableView.register(UINib(nibName: "HPMainAdTableViewCell", bundle: nil), forCellReuseIdentifier: HPMainAdTableViewCellId)
        tableView.frame=CGRect(x: 0, y: self.navigationBar1.frame.maxY, width: UIScreen.kWidth(), height: UIScreen.kHeight()-self.navigationBar1.frame.maxY)
        tableView.separatorStyle=UITableViewCellSeparatorStyle.none
        view.addSubview(tableView)
    }

}

// MARK: - data
extension ChuFangViewController{
    func loaddatas() -> () {
        
        hpMainViewModel.loadMainDatas { [weak self]  (success:Bool, models:[HPNavTitleModel]?,popurl,pop_events) in
            
            self?.tableView.reloadData()
        }
        hpMainViewModel.loadexplore_tabs {[weak self]  (success, json) in
            self?.tableView.reloadData()
        }
    }
    
}
extension ChuFangViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2+(hpMainViewModel.explore_tabsArray?.count ?? 0)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
          let cell1=tableView.dequeueReusableCell(withIdentifier:HPMainTitleBarTableViewCellId) as! HPMainTitleBarTableViewCell
           cell1.celldata=hpMainViewModel.titleArray
            return cell1
        }
        if indexPath.row == 1{
            let cell1=tableView.dequeueReusableCell(withIdentifier: HPPop_eventTableViewCellId) as! HPPop_eventTableViewCell
            cell1.setFirstLabel(with: "本周\n流行菜谱", second: "你的好友\n在分享美食", first: hpMainViewModel.pop_recipe_picurl ,second: nil)
            return cell1
        }
        if indexPath.row == 2{
            let cell1=tableView.dequeueReusableCell(withIdentifier: HPBannerTableViewCellId) as! HPBannerTableViewCell
            cell1.pageControl.numberOfPages=self.pop_event_Count
            cell1.celldatas=hpMainViewModel.bannerArray
             cell1.pageControl.frame = CGRect(x: 0, y: cell1.pagerView.frame.height - 26.0, width: cell1.pagerView.frame.size.width, height: 26)
            return cell1
        }
        //广告
        if indexPath.row == 1+(hpMainViewModel.explore_tabsArray?.count ?? 0)  {
            let cell1=tableView.dequeueReusableCell(withIdentifier: HPMainAdTableViewCellId) as! HPMainAdTableViewCell
            cell1.celldatas=hpMainViewModel.explore_tabsArray?[indexPath.row-2] as? NSDictionary
            return cell1
        }
        let cell1=tableView.dequeueReusableCell(withIdentifier: HPMainTableViewCellId) as! HPMainTableViewCell
        cell1.explore_tabsDic=hpMainViewModel.explore_tabsArray?[indexPath.row-2] as? NSDictionary
        return cell1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 100
        }
        if indexPath.row == 1{
            return 150
        }
        if indexPath.row == 2{
            return 120
        }
        
        let exploreDic=hpMainViewModel.explore_tabsArray?[indexPath.row-2] as? NSDictionary
        let tabsId=exploreDic?["id"] as? String
        
        if let tabId = tabsId {
            if tabId == "5"{
                
                return 320
            }
        }
        
         if indexPath.row == 1+(hpMainViewModel.explore_tabsArray?.count ?? 0)  {
        
            return 280
        }
        return 370
    }
}
extension ChuFangViewController:HPNavigationBarDelegate{
    func searchBarClick(with bar: HPNavigationBar, and searchBar: UISearchBar) {
        self.present(HPMainSearchViewController(), animated: false, completion: nil)
    }
    func addButtonClick(with Button: UIButton) {
        let createRecipeView=HPCreateRecipeView.loadRecipeView()
       view.window?.addSubview(createRecipeView)
    }
    
}
