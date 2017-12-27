//
//  Pop_recipe_View.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/24.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit
@objc
protocol Pop_recipe_ViewDelegate {
    @objc optional func imageClick(with view:Pop_recipe_View,and data:NSDictionary?,and button:UIButton)
}
class Pop_recipe_View: UIView {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    var nibview : UIView!
    
    var delegate:Pop_recipe_ViewDelegate?
    
    @IBAction func firImageClick(_ sender: Any) {
        delegate?.imageClick?(with: self, and: nil, and: sender as! UIButton)
        
    }
    
   
    @IBAction func secondImageClick(_ sender: Any) {
        delegate?.imageClick?(with: self, and: nil, and: sender as! UIButton)
        
    }
    
    override func awakeFromNib() {
      
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    func loadnibView() {
        let className=type(of: self)
        let bundle=Bundle(for: className)
        let name=NSStringFromClass(className).components(separatedBy: ".").last
        let nib=UINib(nibName: name!, bundle: bundle)
        nibview=nib.instantiate(withOwner: self, options:nil).first as! UIView
        nibview.frame=self.bounds
        addSubview(nibview)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
          loadnibView()
    }
    func setFirstLabel(with text1:String,second text2:String,first ImageURL1:String?,second ImageURL2:String?) -> () {
        if let firstLabel=firstLabel,
           let secondLabel=secondLabel,
           let firstImageView=firstImageView,
           let secondImageView=secondImageView  {
                firstLabel.text=text1
                secondLabel.text=text2
                secondImageView.image=UIImage(named: "feedsNotLogin_320x240_")
                guard let ImageURL1 = ImageURL1 else {
                    return
                }
                firstImageView.sd_setImage(with: URL(string: ImageURL1), placeholderImage: UIImage(named: "feedsNotLogin_320x240_"), options: .retryFailed, completed: nil)
        }
      
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        nibview?.frame=self.bounds

    }
}
