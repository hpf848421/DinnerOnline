//
//  HPCollectionViewLeftFlowLayout.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/12/1.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class HPCollectionViewLeftFlowLayout: UICollectionViewFlowLayout {
    /** 每一列之间的间距 */
    var columnMargin : CGFloat = 10
    /** 每一行之间的间距 */
    var rowMargin : CGFloat = 10
 
    var  attributeArray = [UICollectionViewLayoutAttributes]()
    
    override func prepare() {
        super.prepare()
        self.attributeArray.removeAll()
           let count = self.collectionView?.numberOfItems(inSection: 0) ?? 0
  
        for i in 0 ..< count{
            let attribute = self.layoutAttributesForItem(at: IndexPath(item: i, section: 0))
            guard let attribute1 = attribute else{
                continue
            }
            self.attributeArray.append(attribute1)
            
        }
        
        if let headerArrtibute =  self.layoutAttributesForSupplementaryView(ofKind: UICollectionElementKindSectionHeader, at: IndexPath(item: 0, section: 0)){
            
            self.attributeArray.append(headerArrtibute)
        }
     
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.attributeArray
    }
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
      let layoutAttribute  =  super.layoutAttributesForItem(at: indexPath)
        if let layoutAttribute = layoutAttribute {
            if indexPath.item > 0 {
             
                let layoutAttribute1=self.attributeArray[indexPath.item-1]
                //剩下的宽度
                let width1 = collectionView!.frame.size.width - layoutAttribute1.frame.maxX - collectionView!.contentInset.right - self.rowMargin
                //需要的宽度
                let needWidth =  layoutAttribute.frame.width
                //剩下的宽度足够放下一个item
                if width1 > needWidth {
                    
                    layoutAttribute.frame=CGRect(x: layoutAttribute1.frame.maxX + rowMargin , y: layoutAttribute1.frame.origin.y, width: layoutAttribute.frame.width, height: layoutAttribute.frame.height)
                    
                }else{
                    //剩下的宽度不够放下一个item  换行
                    layoutAttribute.frame=CGRect(x: collectionView!.contentInset.left , y: layoutAttribute1.frame.maxY + columnMargin, width: layoutAttribute.frame.width, height: layoutAttribute.frame.height)
                }
                
                 return layoutAttribute
            }else{
                    layoutAttribute.frame=CGRect(x: collectionView!.contentInset.left, y: 40, width: layoutAttribute.frame.size.width, height: layoutAttribute.frame.size.height)
                return layoutAttribute
            }
        }
     
        return layoutAttribute
    }
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes?{
        
        let headerAttr=super.layoutAttributesForSupplementaryView(ofKind: elementKind, at: indexPath)
        headerAttr?.frame=CGRect(x: 0, y: 0, width: UIScreen.kWidth(), height: 40)
        return headerAttr
    }
    
}
