//
//  LeftViewController.swift
//  HappyNews
//
//  Created by lanou on 16/3/25.
//  Copyright © 2016年 corporal. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController, UITableViewDelegate,
                          UITableViewDataSource {
    
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        setTableView()
        // Do any additional setup after loading the view.
    }

    func setTableView(){
        
        tableView = UITableView(frame: CGRectMake(0, 0, Common.screenWidth * 0.7, view.frame.height), style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        view.addSubview(tableView)
        
        // 设置headerView
        let headImageViewHeight: CGFloat = 160
        let headImageView = UIImageView(frame: CGRectMake(0, 0, Common.screenWidth * 0.7, headImageViewHeight))
        headImageView.image = UIImage(named: "quesheng")
        
        tableView.tableHeaderView = headImageView
        tableView.tableFooterView = UIView()
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "reuse"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .Value1, reuseIdentifier: identifier)
            cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell?.selectionStyle = .None
            
        }
        cell?.textLabel?.text = "我的主页"
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPositionNone)
        
        switch indexPath.row{
        case 0:
//            let newsVC = NewsViewController()
            
            let menuVC = MenuViewController()
            let centerNavigation = UINavigationController(rootViewController: menuVC)
            let appDelegate = UIApplication.sharedApplication().delegate as!AppDelegate
            
            appDelegate.drawerController.centerViewController = centerNavigation
            appDelegate.drawerController.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
        default:
            return
        
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
