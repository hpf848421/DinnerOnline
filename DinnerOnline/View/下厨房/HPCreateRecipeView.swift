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
    
    
    @IBOutlet weak var leftAnimationView: UIView!
    
    @IBOutlet weak var rightAnimationView: UIView!
    
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
    
   static func loadRecipeView() -> HPCreateRecipeView {
        let recipeview=UINib(nibName: "HPCreateRecipeView", bundle: nil).instantiate(withOwner: nil, options: [:]).first as! HPCreateRecipeView
//        recipeview.alpha=0
        recipeview.frame=CGRect(x: 0, y: 0, width: UIScreen.kWidth(), height: UIScreen.kHeight())
        return recipeview
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override func awakeFromNib() {
        alpha=0;
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
        
        let leftFirstLayer = CALayer()
        leftFirstLayer.frame=CGRect(x: 0, y: 0, width: leftAnimationView.bounds.width, height: 80)
        leftFirstLayer.backgroundColor=UIColor(displayHelperWithRed: 170.0, green: 235.0, blue: 251.0, alpha: 1).cgColor
        
        let popScale =  POPBasicAnimation(propertyNamed: kPOPViewScaleXY)
        popScale?.fromValue=0.1
        popScale?.toValue=1
        
        popScale?.duration=0.5
        leftFirstLayer.pop_add(popScale, forKey: "scalexy")
        
        
        leftAnimationView.layer.addSublayer(leftFirstLayer)
        
  
        
        
        
    }
}
