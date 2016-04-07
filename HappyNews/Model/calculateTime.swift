//
//  calculateTime.swift
//  HappyNews
//
//  Created by lanou on 16/4/7.
//  Copyright © 2016年 corporal. All rights reserved.
//

import UIKit


class calculateTime: NSObject {

    func calculate(origindata: String){
        
        // 计算当前时间
//        let currentDate: NSDate = NSDate(timeIntervalSinceNow: 8*60*60)
//        var currentDate: NSDate = NSDate.date()
        let currentDate: NSDate = NSDate(timeIntervalSinceNow: 0)
        
        
        // 计算文章发表的时间
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let articledates = dateFormatter.dateFromString(origindata)
        
        
        let timeIntervaler = currentDate.timeIntervalSinceDate(articledates!)
        
        // 直接截去小数部分转换成整数 
        // 使用强制转换会将浮点部分去除，把整数部分转换为整数。
        let timeInterval = Int(timeIntervaler)
        
        // 四舍五入转换成整数
        // lroundf是一个全局函数，作用是将浮点数四舍五入转为整数。
//        let timeInterval = lround(timeIntervaler)
        
        if (timeInterval <= 60){
          print("刚刚")
        }
        else if(timeInterval <= 3600){
            
            print("\(timeInterval / 60)分钟前")
           
        }
        else if(timeInterval <= 3600 * 24){
            
            print("\(timeInterval / 3600)小时前")
            
        }
        
        
        
    }
    
    
    
    
    
    
}
