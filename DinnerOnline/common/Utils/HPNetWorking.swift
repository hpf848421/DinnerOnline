//
//  HPNetWorking.swift
//  DinnerOnline
//
//  Created by 胡彭飞 on 2017/11/23.
//  Copyright © 2017年 ztq. All rights reserved.
//

import UIKit
import AFNetworking
class HPNetWorking: AFHTTPSessionManager {
    static let shared :HPNetWorking = {
        
        // 实例化对象
        let instance = HPNetWorking()
        
        // 设置响应反序列化支持的数据类型
        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        // 2.设置非校验证书模式
        instance.securityPolicy = AFSecurityPolicy(pinningMode: AFSSLPinningMode.none);
        instance.securityPolicy.allowInvalidCertificates = true;
        instance.securityPolicy.validatesDomainName=false;

        return instance
        
    }()
    
}
