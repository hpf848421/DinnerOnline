//
//  HPMainSearchViewController.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/30.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class HPMainSearchViewController: UIViewController {
    var HPSearchItemCollectionViewCellId = "HPSearchItemCollectionViewCell"
    var HPSearchItemCollectionViewCellHeaderId = "HPSearchItemCollectionViewCellHeaderId"
    
    lazy var collectionViewdatas = ["蛋糕","蛋挞","红烧肉","面包","可乐鸡翅","家常菜","早餐","糖醋排骨","豆腐","牛肉","披萨","饼干","排骨","茄子","牛轧糖","土豆","虾","雪花酥","汤","南瓜饼"]
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
        searchBar.tintColor=UIColor.orange
        let cancelButton = UIButton(frame: CGRect(x: UIScreen.kWidth()-50, y: 25, width: 40, height: 30))
        view.addSubview(cancelButton)
        cancelButton.setTitle("取消", for: UIControlState.normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonClick), for: UIControlEvents.touchUpInside)
//        cancelButton.setTitleColor(UIColor(displayP3Red: 252/255.0, green: 98/255.0, blue: 86/255.0, alpha: 1), for: UIControlState.normal)
        cancelButton.setTitleColor(UIColor(displayHelperWithRed: 252, green: 98, blue: 86, alpha: 1), for: UIControlState.normal)
        searchBar.becomeFirstResponder()
        let layout = HPCollectionViewLeftFlowLayout()
        layout.scrollDirection=UICollectionViewScrollDirection.vertical
        layout.headerReferenceSize = CGSize(width: UIScreen.kWidth(), height: 40)
    
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 60, width: UIScreen.kWidth(), height: UIScreen.kHeight()-60), collectionViewLayout: layout)
        collectionView.backgroundColor=UIColor.white
        collectionView.register(UINib(nibName: "HPSearchItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: HPSearchItemCollectionViewCellId)
        collectionView.register(UINib(nibName: "HPHeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HPSearchItemCollectionViewCellHeaderId)
        view.addSubview(collectionView)
        collectionView.delegate=self
        collectionView.contentInset=UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.dataSource=self
//        collectionView.contentSize=CGSize(width: 0, height: UIScreen.kHeight())
        collectionView.alwaysBounceVertical=true
    }

    @objc func cancelButtonClick(){
        dismiss(animated: false, completion: nil)
        
    }

}
extension HPMainSearchViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewdatas.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell1=collectionView.dequeueReusableCell(withReuseIdentifier: HPSearchItemCollectionViewCellId, for: indexPath) as! HPSearchItemCollectionViewCell
        cell1.titleLabel.text=collectionViewdatas[indexPath.item]
        return cell1
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
      let title =  collectionViewdatas[indexPath.item] as NSString
        let width1=title.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 30), options: NSStringDrawingOptions(rawValue: NSStringDrawingOptions.RawValue(UInt8(NSStringDrawingOptions.usesLineFragmentOrigin.rawValue)|UInt8(NSStringDrawingOptions.usesFontLeading.rawValue))), attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 17)], context: nil).size.width+30
        
        return CGSize(width: width1, height: 30)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        
        return 10
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 10
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HPSearchItemCollectionViewCellHeaderId, for: indexPath) as! HPHeaderCollectionReusableView
            headerView.frame=CGRect(x: 0, y: 0, width: UIScreen.kWidth(), height: 40)
                 return headerView
        }
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HPSearchItemCollectionViewCellHeaderId, for: indexPath) as! HPHeaderCollectionReusableView
            return footerView

   
    }

    
}
