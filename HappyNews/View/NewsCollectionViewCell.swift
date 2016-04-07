//
//  NewsCollectionViewCell.swift
//  HappyNews
//
//  Created by lanou on 16/3/25.
//  Copyright © 2016年 corporal. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var titleLB1: UILabel!
    @IBOutlet weak var titleLB2: UILabel!
    @IBOutlet weak var titleLB3: UILabel!
    @IBOutlet weak var titleLB4: UILabel!
    @IBOutlet weak var titleLB5: UILabel!
    @IBOutlet weak var titleLB6: UILabel!
    
    
    @IBOutlet weak var contentView1: UIView!
    @IBOutlet weak var contentView2: UIView!
    @IBOutlet weak var contentView3: UIView!
    @IBOutlet weak var contentView4: UIView!
    @IBOutlet weak var contentView5: UIView!
    @IBOutlet weak var contentView6: UIView!
    
    
    @IBOutlet weak var detailLB1: UILabel!
    @IBOutlet weak var detailLB2: UILabel!
    @IBOutlet weak var detailLB3: UILabel!
    @IBOutlet weak var detailLB4: UILabel!
    @IBOutlet weak var detailLB5: UILabel!

    @IBOutlet weak var imageview: UIImageView!
    
    var titleArray:Array<UILabel>!
    var contentViewArray:NSArray!
    var detailLabelArray:Array<UILabel>!
    var newsArr:Array<AnyObject>!
    var toucher:UITouch!
    

    
    var number:Array<AnyObject> {

        get{
            return self.newsArr
        }
        
        set{
            
            self.newsArr = newValue
            
//            print("没有排序前的格式\(newsArr)")
            
            for var i = 0; i < self.newsArr.count; i++ {
                for var j = 0; j < self.newsArr.count - i - 1; j++ {
                    let news:NewsModel = newValue[j] as! NewsModel
                    if (news.thumbnail_mpic == nil) {
                        var newsmodeler = NewsModel()
                        
                        newsmodeler = newValue[j] as! NewsModel
                        self.newsArr[j] = newValue[j + 1]
                        self.newsArr[j + 1] = newsmodeler
                    }
                }
            }
            
//            print("排序后的的格式格式\(newsArr)")
            
            self.contentViewArray = [self.contentView1, self.contentView2, self.contentView3, self.contentView4, self.contentView5, self.contentView6]
            self.titleArray = [self.titleLB1, self.titleLB2, self.titleLB3, self.titleLB4, self.titleLB5, self.titleLB6]
            self.detailLabelArray = [self.detailLB1, self.detailLB2, self.detailLB3, self.detailLB4, self.detailLB5]
            
            
            let count = newValue.count
            var titleLabel = UILabel()
            var detailLabel = UILabel()
            var view = UIView()
            var news = NewsModel()
            
            for var i = 0; i < count; i++ {
                news = newsArr[i] as! NewsModel
                view = contentViewArray[i] as! UIView
                view.layer.borderWidth = 0.25
                view.layer.borderColor = UIColor.lightGrayColor().CGColor
                
                if news.date != nil{
                let time = news.date! as String
                // 在本类中调用别的类的方法
                let b = calculateTime()
                b.calculate(time)
                }
                
                
                
                if (news.title != nil) {
                    titleLabel = self.titleArray[i]
                    titleLabel.text = news.title
                }
                
                if (news.auther_name != nil && i < count && i != 0){
                    detailLabel = self.detailLabelArray[i - 1]
                    detailLabel.text = news.auther_name
                    
                    
                }
                
                if i == 0 {
                    
                    if (news.thumbnail_mpic != nil) {
                        
                        self.imageview.sd_setImageWithURL(NSURL(string: news.thumbnail_mpic), placeholderImage: UIImage(named: "quesheng"))
                    }
                    
                }
                
                
            }
            
        }
        
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
        
            toucher = touch as! UITouch
        
            self.contentViewArray.enumerateObjectsUsingBlock({ (view, idx, stop) -> Void in
                
                let point = self.toucher.locationInView(view as? UIView)
                
                if view.pointInside(point, withEvent: event) {
                    
                    print("____下标为\(idx)")
                    
                    let model = self.newsArr[idx] as! NewsModel
                    
                    let vc = NewsDetailViewController()
                    vc.model = model
                    view.navController!().pushViewController(vc, animated: true)
                    
                }
            })
            
        
        
        }
        
    }
    
    

     override func layoutSubviews() {
        
        super.layoutSubviews()
    
//        if self.contentViewArray == nil{
//        self.contentViewArray = [self.contentView1, self.contentView2, self.contentView3, self.contentView4, self.contentView5, self.contentView6]
//        }
//        
//        
//        if self.titleArray == nil{
//        self.titleArray = [self.titleLB1, self.titleLB2, self.titleLB3, self.titleLB4, self.titleLB5, self.titleLB6]
//        }
        
        
        self.titleLB1.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        
        
    }
    
    
    
//    lazy var contentViewArray: Array<UIView>? = {
//        
//        [unowned self] in
//        if self.contentViewArray == nil{
//        self.contentViewArray = [self.contentView1, self.contentView2, self.contentView3, self.contentView4, self.contentView5, self.contentView6]
//            
//        }
//        
//        return self.contentViewArray
//    }()
//    
//    deinit{
//        
//        
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
