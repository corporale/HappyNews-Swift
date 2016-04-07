//
//  NewsViewController.swift
//  HappyNews
//
//  Created by lanou on 16/3/25.
//  Copyright © 2016年 corporal. All rights reserved.
//

import UIKit



class NewsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var collectionView:UICollectionView!
    var httpManager:AFHTTPSessionManager!
    var newsArr:Array<Dictionary<String, AnyObject>>!
//    var newsArr:Array<AnyObject>!
    
    
    var newsconsistArr:Array<AnyObject>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.whiteColor()
        
//        self.navigationItem.title = "头条"
       
//        let navigationBar = UIButton(frame: CGRectMake(10, 10, 30, 30))
//        navigationBar.setBackgroundImage(UIImage(named: "done"), forState: UIControlState.Normal)
//        self.view.addSubview(navigationBar)
//        navigationBar.addTarget(self, action: "doneSlider", forControlEvents: UIControlEvents.TouchUpInside)
//        
//        self.navigationController?.navigationBarHidden = true
        
        loadData()
        
        
        setupCollectionView()
        
        
        
        
        // 防止出现提示
        self.automaticallyAdjustsScrollViewInsets = false;
        
        
            
        
    }
    
    
    
    
    
    func setupCollectionView(){
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSize(width: kscreenWidth, height: kscreenHeight)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        
        
        self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        self.collectionView.backgroundColor = UIColor.whiteColor()
        
        self.collectionView.pagingEnabled = true
        
        // 测试
//        self.collectionView.backgroundColor = UIColor.yellowColor() 
        
        self.collectionView.registerNib(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "reuseful")
        
        self.view.addSubview(self.collectionView)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    
       
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.newsconsistArr == nil {
            return 5
        }
        else{
            return self.newsconsistArr.count
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:NewsCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("reuseful", forIndexPath: indexPath) as! NewsCollectionViewCell
        
        if self.newsconsistArr != nil {
        
        cell.number = self.newsconsistArr[indexPath.row] as! Array<AnyObject>
//        print("_____shuju\(cell.newsArr)")
            
        
        }
        return cell
        
        
    }
    
    
    
    func loadData(){
        
       
       self.httpManager = AFHTTPSessionManager()
        
       // 注意有两个info.plist文件, 不要加错
       self.httpManager.GET(newsUrl, parameters: nil, progress: nil, success: { (Task, responseObject) -> Void in
        
//        print("__数据是\(responseObject)")
        
        let dic:AnyObject! = responseObject
        let dic1:AnyObject! = dic.objectForKey("data")
        let dic2:AnyObject! = dic1["articles"]
        self.newsArr = dic2! as! Array<Dictionary<String, AnyObject>>
        
        print(self.newsArr)
        
        let count = self.newsArr.count
        var page = Array<AnyObject>()
        var pages = Array<AnyObject>()

        for var i = 0; i < count; i++ {
            let newsmodel = NewsModel()
            newsmodel.setValuesForKeysWithDictionary(self.newsArr[i] )
            page.append(newsmodel)
            while page.count == 6 {
                pages.append(page)
                page = Array<AnyObject>()
                
            }
            
        }
        self.newsconsistArr = pages
        
        self.collectionView.reloadData()
        

        
        }) { (NSURLSessionDataTask, NSError) -> Void in
            print("___\(NSError)")
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
