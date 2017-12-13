//
//  HPCameraLayerDelegate.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/12/13.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class HPCameraLayerDelegate: NSObject,CALayerDelegate {
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.saveGState()
        let createEntryCamera_26x23_=UIImage(named: "createEntryCamera_26x23_")
        ctx.translateBy(x: 0, y: layer.bounds.size.height)
        ctx.scaleBy(x: 1.0, y: -1.0)
        ctx.draw((createEntryCamera_26x23_?.cgImage)!, in:CGRect(x: (layer.bounds.size.width)*0.5-13, y: (layer.bounds.size.height)*0.5-11.5, width: 26, height: 23))
     
        ctx.restoreGState()
    }
    
}
