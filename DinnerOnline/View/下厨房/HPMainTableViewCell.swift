//
//  HPMainTableViewCell.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/27.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class HPMainTableViewCell: UITableViewCell {
  
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionBackground: UIView!
    
    static var HPMainCollectionViewCellId:String = "HPMainCollectionViewCellId"
    static var HPMainRecommendCollectionViewCellId:String = "HPMainRecommendCollectionViewCellId"
    var explore_tabsDic : NSDictionary?{
        didSet{
            guard let explore_tabsDic=explore_tabsDic  else {
                return
            }
            let title=explore_tabsDic["title"] as? String
         
            titleLabel.text=title
            self.collectionView?.reloadData()
            
        }
    }
    var tabId : String?{
        guard let explore_tabsDic=explore_tabsDic  else {
            return nil
        }
        let tabsId=explore_tabsDic["id"] as? String
        if tabsId == "5"{
            let collectionFlowlayout=collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
            collectionFlowlayout?.itemSize=CGSize(width: UIScreen.kWidth()-20, height: 270)
            collectionView?.frame.size.height=270
        }else{
            let collectionFlowlayout=collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
            collectionFlowlayout?.itemSize=CGSize(width: 185, height: 320)
            collectionView?.frame.size.height=320
        }
        return tabsId
    }
    
    var portals : NSArray?{
        guard let explore_tabsDic=explore_tabsDic  else {
            return nil
        }
         let portalsArray=explore_tabsDic["portals"] as? NSArray
        
        return portalsArray
    }
    
    var tabWH : CGFloat?{
        guard let explore_tabsDic=explore_tabsDic,
            let tab_style=explore_tabsDic["tab_style"] as? NSDictionary,
            let width1 = tab_style["width"] as? CGFloat,
            let height1 = tab_style["height"] as? CGFloat
            else {
                return 0
            }
        return width1/height1
    }
     var collectionView : UICollectionView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addCollectionView()
        selectionStyle=UITableViewCellSelectionStyle.none
        selectionStyle=UITableViewCellSelectionStyle.none
    }

    func addCollectionView()  {
        
        let layout=UICollectionViewFlowLayout()
        layout.itemSize=CGSize(width: 185, height: 320)
        layout.minimumInteritemSpacing=15
        //        layout.minimumLineSpacing=10
        layout.scrollDirection=UICollectionViewScrollDirection.horizontal
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.kWidth(), height: 320), collectionViewLayout: layout)
        collectionView?.showsHorizontalScrollIndicator=false
        collectionView?.backgroundColor=UIColor.white
        collectionView?.contentInset=UIEdgeInsetsMake(0, 10, 0, 10)
        collectionView?.register(UINib(nibName: "HPMainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:HPMainTableViewCell.HPMainCollectionViewCellId)
        collectionView?.register(UINib(nibName: "HPMainRecommendCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:HPMainTableViewCell.HPMainRecommendCollectionViewCellId)
        
        collectionView?.delegate = self
        collectionView?.dataSource = self

        
        collectionBackground.addSubview(self.collectionView!)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.collectionView.bounds=collectionBackground.bounds
    }
}
extension HPMainTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.portals?.count ?? 0
        
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        if self.tabId == "5" {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HPMainTableViewCell.HPMainRecommendCollectionViewCellId, for: indexPath) as! HPMainRecommendCollectionViewCell
            cell.tabId=self.tabId
            cell.tabWH=self.tabWH ?? 0.687
            cell.portals=self.portals?[indexPath.item] as? NSDictionary
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HPMainTableViewCell.HPMainCollectionViewCellId, for: indexPath) as! HPMainCollectionViewCell
        cell.tabId=self.tabId
        cell.tabWH=self.tabWH ?? 0.687
        cell.portals=self.portals?[indexPath.item] as? NSDictionary
        return cell
       

    }
    
}
