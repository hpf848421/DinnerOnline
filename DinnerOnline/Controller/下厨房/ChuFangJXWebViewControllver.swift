//
//  ChuFangJXWebViewControllver.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/12/27.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit

class ChuFangJXWebViewControllver: PopTitleBaseViewController {

    lazy var webView : UIWebView = {
        
        var webview = UIWebView(frame: CGRect(x: 0, y: self.navigationBar1.frame.maxY, width: UIScreen.kWidth(), height: UIScreen.kHeight()-self.navigationBar1.frame.maxY))
        
        return webview
    }()
    
    var webDatas:HPNavTitleModel?{
        didSet{
            
            guard let webDatas = webDatas,
                  let url = webDatas.url
                else {
                return
            }
            
            webView.loadRequest(URLRequest(url: URL(string: url)!))
            setTitleStr(title: webDatas.name!)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addwebView()
        
    }
    func addwebView(){
        view.addSubview(webView)
        
        
    }

}
