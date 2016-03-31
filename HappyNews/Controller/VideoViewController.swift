//
//  VideoViewController.swift
//  HappyNews
//
//  Created by lanou on 16/3/25.
//  Copyright © 2016年 corporal. All rights reserved.
//

import UIKit

import Alamofire

class VideoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableview:UITableView!
    var mediaArrayer:NSMutableArray! // 存放原始数据的数组
    
    var mediaArray:NSMutableArray!   // 存放model的数组

    var refreshControl:UIRefreshControl!
    var activiLoading:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        self.tableview = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.tableview)
        
        self.tableview.tableFooterView = UIView()
        self.mediaArray = NSMutableArray()
        
        
        refreshData()
        
    
    }
    
    func refreshData(){
        Alamofire.request(.GET, "http://c.3g.163.com/nc/video/list/V9LG4B3A0/y/0-5.html").responseJSON(){
            response in
            if response.result.isSuccess {
                
//                print("____\(response)")
                self.mediaArrayer = response.result.value?.objectForKey("V9LG4B3A0") as! NSMutableArray
                print("____\(self.mediaArrayer)")
            
                for i in 0..<self.mediaArrayer.count{
                    
                    let mediaModel = MediaModel()
                    mediaModel.setValuesForKeysWithDictionary(self.mediaArrayer[i] as! [String : AnyObject])
                    
                    self.mediaArray.addObject(mediaModel)
                    
                }
               self.tableview.reloadData()
                print(self.mediaArray.count)
            }
            
            
            else
            {
                print("___\(response.result.error)")
            }
            
        }
        
        
        
        
        
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 80
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableview.dequeueReusableCellWithIdentifier("video")
        if cell == nil{
            
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "video")
            
        }
        return cell!
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.mediaArray != nil {
            
            return self.mediaArray.count
        }
        else{
            
            return 0
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
