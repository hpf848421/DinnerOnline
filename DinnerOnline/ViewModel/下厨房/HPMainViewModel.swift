//
//  HPMainViewModel.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/23.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit
import AFNetworking
import YYModel
class HPMainViewModel: NSObject {
    
    var bannerArray : NSDictionary?
    lazy var titleArray = [HPNavTitleModel]()
    var pop_recipe_picurl : String?
    
    var explore_tabsArray:NSArray?
    
     func loadMainDatas(_ complete:@escaping (_ success:Bool,_ datas:[HPNavTitleModel]?,_ pop_recipe_picurl:String?,_ pop_events:NSDictionary?)->()) {
        
        HPNetWorking.shared.get("https://api.xiachufang.com/v2/init_page_v5.json?_ts=1511399886.463117&api_key=07397197043fafe11ce5c65c10febf84&api_sign=ad210a57921a12183c176e64350e62d5&location_code=156350100000000&nonce=00B02E0A-73F4-4B73-9D25-5CFBD963BBE4&origin=iphone&sk=&timezone=Asia/Shanghai&version=6.3.9&webp=1", parameters: [], success: { (datatask, json) in
          let dict = json as? [String: AnyObject]
            
            guard let content1 = dict?["content"] as? NSDictionary,
                  let content2 = content1["navs"] as? [[AnyHashable:Any]]  else{
             complete(false,nil,nil,nil)
                return
            }
            var array = [HPNavTitleModel]()
            let pop_recipe_picurl1=content1["pop_recipe_picurl"] as? String
            self.pop_recipe_picurl=pop_recipe_picurl1
            for dict in content2{
                
                let nav = HPNavTitleModel()
                 nav.yy_modelSet(with: dict)
                array.append(nav)
            }
             let pop_events=content1["pop_events"] as? NSDictionary
            self.bannerArray = pop_events
            self.titleArray = array
            complete(true, array,pop_recipe_picurl1,pop_events)
            
            
            
            
        }) { (datatask, error) in
            complete(false, nil,nil,nil)
        }
    }
    
    
    
    func loadexplore_tabs(_ complete:@escaping (_ success:Bool,_ data:NSDictionary?)->()) {
        HPNetWorking.shared.get("https://api.xiachufang.com/v2/explore_tabs/paged_explore_tabs.json?_ts=1511923969.479472&api_key=07397197043fafe11ce5c65c10febf84&api_sign=37ad1dedf83b3ac47a204dcb1a6cd407&cursor=&location_code=156350100000000&nonce=0C2136A7-E57E-4CD6-A20C-8A2F0BC1C939&origin=iphone&size=20&sk=&version=6.3.9&webp=1", parameters:[], success: { (datatask, json) in
           let jsonDic = json as? [String:Any]
            guard let jsonDic1 = jsonDic,
                  let contentDic = jsonDic1["content"] as? NSDictionary,
                  let explore_tabsArray = contentDic["explore_tabs"] as? NSArray
                else {
                        complete(false,nil)
                        return
                    }
            self.explore_tabsArray=explore_tabsArray
            complete(true, contentDic)
            
        }) { (datatask, error) in

             complete(false,nil)
            
        }

    }
    
}
