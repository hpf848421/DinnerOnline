//
//  HPCreateRecipeView.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/12/1.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit
import pop
class HPCreateRecipeView: UIView{
    var BUTTONROTATION = "buttonRotationPI2"
    var VIEWALPH = "VIEWALPH"
    @IBOutlet weak var closeButton: UIButton!
    
    
    @IBOutlet weak var leftAnimationView: UIView!
    
    @IBOutlet weak var rightAnimationView: UIView!
    
    private var cameraLayerDelegate : HPCameraLayerDelegate?
    
    var LEFTBLUECOLOR : CGColor {

        return UIColor(displayHelperWithRed: 170.0, green: 235.0, blue: 251.0, alpha: 1).cgColor
    }
    var RIGHTORANGECOLOR : CGColor {
        
        return UIColor(displayHelperWithRed: 255, green: 234, blue: 110, alpha: 1).cgColor
    }
    @IBAction func closeButtonClick(_ sender: Any) {
        let popAnimation = POPBasicAnimation(propertyNamed: kPOPLayerRotation)
        popAnimation?.fromValue=Double.pi/4
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
        popAnimation?.toValue=Double.pi/4
        popAnimation?.duration=0.5
        closeButton.layer.pop_add(popAnimation, forKey: BUTTONROTATION)
        
        leftAnimationView.layer.borderColor=LEFTBLUECOLOR
        leftAnimationView.layer.borderWidth=1
        
        rightAnimationView.layer.borderColor=RIGHTORANGECOLOR
        rightAnimationView.layer.borderWidth=1
        
        
        let popAlphAnimation = POPBasicAnimation(propertyNamed: kPOPLayerOpacity)
        popAlphAnimation?.fromValue=0
        popAlphAnimation?.toValue=1
        popAlphAnimation?.duration=0.5
        layer.pop_add(popAlphAnimation, forKey: VIEWALPH)
 
        cameraLayerDelegate = HPCameraLayerDelegate()
        
        let leftFirstLayer = CALayer()
        leftFirstLayer.delegate=cameraLayerDelegate
        leftFirstLayer.frame=CGRect(x: 0, y: 0, width: leftAnimationView.bounds.width, height: 80)
        leftFirstLayer.backgroundColor=LEFTBLUECOLOR
             leftAnimationView.layer.addSublayer(leftFirstLayer)
//
            leftFirstLayer.setNeedsDisplay()
        
        let popScale =  POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        popScale?.fromValue=NSValue(cgSize: CGSize(width: 0, height: 0))
        popScale?.toValue=NSValue(cgSize: CGSize(width: 1, height: 1))
        popScale?.duration=0.5
        leftFirstLayer.pop_add(popScale, forKey: "scalexy")
        leftAnimationView.layer.addSublayer(leftFirstLayer)
        
        
   
        
        let leftsecondLayer = CALayer()
        leftsecondLayer.frame=CGRect(x: 10, y: 100 - 25, width: leftAnimationView.bounds.width - 20, height: 50)
        leftsecondLayer.backgroundColor=LEFTBLUECOLOR
        leftAnimationView.layer.addSublayer(leftsecondLayer)
        leftsecondLayer.anchorPoint=CGPoint(x: 0.5, y: 0)
        let popSize1 =  POPBasicAnimation(propertyNamed: kPOPLayerScaleY)
        popSize1?.fromValue=0
        popSize1?.toValue=1
        //        popScale?.timingFunction=CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        popSize1?.duration=0.5
        leftsecondLayer.pop_add(popSize1, forKey: "scalesize")
        
        let left3Layer = CALayer()
        left3Layer.frame=CGRect(x: 10, y: leftAnimationView.bounds.height - 30 - 15, width: leftAnimationView.bounds.width - 20, height: 30)
        left3Layer.backgroundColor=LEFTBLUECOLOR
        leftAnimationView.layer.addSublayer(left3Layer)
         left3Layer.anchorPoint=CGPoint(x: 0.5, y: 0)
         left3Layer.pop_add(popSize1, forKey: "scalesize")
        
        
        
        let rightFirstLayer = CALayer()
        rightFirstLayer.frame=CGRect(x: 10, y: 10, width: rightAnimationView.bounds.width - 20, height: 100)
        rightFirstLayer.backgroundColor=RIGHTORANGECOLOR
        rightFirstLayer.delegate=cameraLayerDelegate
        rightFirstLayer.setNeedsDisplay()
        
        let popScale1 =  POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        popScale1?.fromValue=NSValue(cgSize: CGSize(width: 0, height: 0))
        popScale1?.toValue=NSValue(cgSize: CGSize(width: 1, height: 1))
        popScale1?.duration=0.5
        rightFirstLayer.pop_add(popScale, forKey: "scalexy")
        rightAnimationView.layer.addSublayer(rightFirstLayer)
        
//        createEntryCamera_26x23_
        let rightsecondLayer = CALayer()
        rightsecondLayer.bounds=CGRect(x: 0, y: 0, width: rightAnimationView.bounds.width - 20, height: 15)
        rightsecondLayer.position=CGPoint(x: 10, y: 120)
         rightsecondLayer.anchorPoint=CGPoint(x: 0, y: 0)
        rightsecondLayer.backgroundColor=RIGHTORANGECOLOR
        rightAnimationView.layer.addSublayer(rightsecondLayer)
      
        
        let popSize2 =  POPBasicAnimation(propertyNamed: kPOPLayerScaleX)
        popSize2?.fromValue=0
        popSize2?.toValue=1
        popSize2?.duration=0.5
        rightsecondLayer.pop_add(popSize2, forKey: "scalesize1")
        
        
        let right3Layer = CALayer()
        right3Layer.bounds=CGRect(x: 0, y: 0, width: rightAnimationView.bounds.width - 20 - 30, height: 15)
        right3Layer.position=CGPoint(x: 10, y: 145)
        right3Layer.anchorPoint=CGPoint(x: 0, y: 0)
        right3Layer.backgroundColor=RIGHTORANGECOLOR
        rightAnimationView.layer.addSublayer(right3Layer)
//        right3Layer.anchorPoint=CGPoint(x: 0, y: 0.5)
        right3Layer.pop_add(popSize2, forKey: "scalesize1")
 

        
    }

    
}

