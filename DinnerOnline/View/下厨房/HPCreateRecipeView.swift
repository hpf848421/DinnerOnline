//
//  HPCreateRecipeView.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/12/1.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit
import pop
class HPCreateRecipeView: UIView {
    var BUTTONROTATION = "buttonRotationPI2"
    var VIEWALPH = "VIEWALPH"
    @IBOutlet weak var closeButton: UIButton!
    
    @IBAction func closeButtonClick(_ sender: Any) {
        let popAnimation = POPBasicAnimation(propertyNamed: kPOPLayerRotation)
        popAnimation?.fromValue=Double.pi/2
        popAnimation?.toValue=0
        popAnimation?.duration=0.5
        closeButton.layer.pop_add(popAnimation, forKey: BUTTONROTATION)
        
        let popAlphAnimation = POPBasicAnimation(propertyNamed: kPOPLayerOpacity)
        popAlphAnimation?.fromValue=1
        popAlphAnimation?.toValue=0
        popAlphAnimation?.duration=0.5
        layer.pop_add(popAlphAnimation, forKey: VIEWALPH)
        
        popAnimation?.completionBlock = {[weak self] (popanimation, comlete) in
            self?.removeFromSuperview()
            
        }
        
    }
    
    override func awakeFromNib() {
            let recipeview=UINib(nibName: "HPCreateRecipeView", bundle: nil).instantiate(withOwner: self, options: [:]).first as! HPCreateRecipeView
        recipeview.frame=CGRect(x: 0, y: 0, width: UIScreen.kWidth(), height: UIScreen.kHeight())
        self.addSubview(recipeview)
        let popAnimation = POPBasicAnimation(propertyNamed: kPOPLayerRotation)
        popAnimation?.fromValue=0
        popAnimation?.toValue=Double.pi/2
        popAnimation?.duration=0.5
        closeButton.layer.pop_add(popAnimation, forKey: BUTTONROTATION)
        let popAlphAnimation = POPBasicAnimation(propertyNamed: kPOPLayerOpacity)
        popAlphAnimation?.fromValue=0
        popAlphAnimation?.toValue=1
        popAlphAnimation?.duration=0.5
        layer.pop_add(popAlphAnimation, forKey: VIEWALPH)
    }
}
