//
//  MenuViewController.swift
//  HappyNews
//
//  Created by lanou on 16/3/30.
//  Copyright © 2016年 corporal. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var newsVC = NewsViewController()
    var videoVC = VideoViewController()
    var happyPlayingVC = HappyPlayingViewController()
    var pictureVC = PictureViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

               
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(named: "done"), style: UIBarButtonItemStyle.Plain, target: self, action: "doneSlider")
        
        self.navigationController?.navigationBar.translucent = true
        
        
        newsVC.title = "头条"
        videoVC.title = "视频"
        happyPlayingVC.title = "玩乐"
        pictureVC.title = "图片"
        
        let skScNavC = SKScNavViewController(subViewControllers: [newsVC, videoVC, happyPlayingVC, pictureVC])
        skScNavC.addParentController(self)
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func doneSlider(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.drawerController.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
        
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
