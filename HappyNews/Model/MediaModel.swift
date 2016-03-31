//
//  MediaModel.swift
//  HappyNews
//
//  Created by lanou on 16/3/31.
//  Copyright © 2016年 corporal. All rights reserved.
//

import UIKit

class MediaModel: NSObject {
    
    var mp4_url:  String!     // 视频网址
    var title:    String!     // 视频标题
    var topicName:String!     // 视频主题
    var topicDesc:String!     // 视频主题描述
    var ptime:    String!     // 时间
    
    var descriptions: String! // 具体描述
    
    var topicImg: String!     // 图片网址
    var playCount: Int16!     // 播放次数
    var length:    Int!       // 视频长度
    
    override func setValuesForKeysWithDictionary(keyedValues: [String : AnyObject]) {
        
        
    }
}
