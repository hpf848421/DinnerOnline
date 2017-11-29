//
//  HPBannerTableViewCell.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/28.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit
class HPBannerTableViewCell: UITableViewCell {
    
    var pop_event_Count : Int = 0
    
    var popevents :[Any]?
    
    var celldatas : NSDictionary?{
        didSet{
            guard let celldatas = celldatas else{
                return
            }
            let pop_eventCount = celldatas["count"] as? Int
            self.pop_event_Count = pop_eventCount ?? 0
            self.popevents=celldatas["events"] as? [Any]
            self.pageControl.numberOfPages=self.pop_event_Count
            self.pageControl.frame = CGRect(x: 0, y: self.pagerView.frame.height - 26.0, width: self.pagerView.frame.size.width, height: 26)
            self.pagerView.reloadData()
        }
        
    }
    
    /// banner
    lazy var pagerView: TYCyclePagerView = {
        let pagerView = TYCyclePagerView()
        pagerView.isInfiniteLoop = false
        //        pagerView.autoScrollInterval = 3.0
        return pagerView
    }()
    /// banner
    lazy var pageControl: TYPageControl = {
        let pageControl = TYPageControl()
        pageControl.pageIndicatorTintColor=UIColor.lightGray
        pageControl.currentPageIndicatorTintColor=UIColor.black
        pageControl.currentPageIndicatorSize = CGSize(width: 8, height: 8)
        return pageControl
    }()
    
    override func awakeFromNib() {
        addPagerView()
        addPageControl()
    }
}
extension HPBannerTableViewCell{
    func addPagerView() {
        
        self.pagerView.dataSource=self
        self.pagerView.delegate=self
        self.pagerView.register(UINib(nibName: "HPMainBannerCell", bundle: nil), forCellWithReuseIdentifier: "BannerCellId")
        self.addSubview(self.pagerView)
        pagerView.frame=CGRect(x: 0, y: 10, width: UIScreen.kWidth(), height: 100)
    }
    func addPageControl() {
        self.pagerView.addSubview(self.pageControl)
        let topMView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.kWidth(), height: 100))
        pagerView.addSubview(topMView)
        topMView.image=UIImage(named: "themeSmallPic_375x100_")
    }
    
    
}
extension HPBannerTableViewCell:TYCyclePagerViewDelegate,TYCyclePagerViewDataSource{
    // MARK: TYCyclePagerViewDataSource
    func numberOfItems(in pageView: TYCyclePagerView) -> Int {
        return pop_event_Count
    }
    
    func pagerView(_ pagerView: TYCyclePagerView, cellForItemAt index: Int) -> UICollectionViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "BannerCellId", for: index)
        let cell1=cell as! HPMainBannerCell
        cell1.celldata=popevents?[index]
        return cell
    }
    
    func layout(for pageView: TYCyclePagerView) -> TYCyclePagerViewLayout {
        let layout = TYCyclePagerViewLayout()
        layout.itemSize = CGSize(width: pageView.frame.width, height: pageView.frame.height)
        layout.itemSpacing = 15
        layout.itemHorizontalCenter = true
        return layout
    }
    
    func pagerView(_ pageView: TYCyclePagerView, didScrollFrom fromIndex: Int, to toIndex: Int) {
        self.pageControl.currentPage = toIndex;
    }
}
