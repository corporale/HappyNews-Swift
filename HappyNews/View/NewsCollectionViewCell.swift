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
    
    
    @IBOutlet weak var imageview: UIImageView!
    
    var titleArray:Array<UILabel>!
    var contentViewArray:Array<UIView>!
    var newsArr:Array<AnyObject>!
    
//    init(newsarray:Array<AnyObject>){
//        
//       self.newsArr = newsarray
//        
//    }

//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    var number:Array<AnyObject> {
//        unowned let unself:NewsCollectionViewCell = self
        get{
            return newsArr
        }
        
        set{
            
           newsArr = newValue
            
//            for var i = 0; i < newValue.count; i++ {
//                for var j = 0; j < newValue.count - i - 1; j++ {
//                    let news:NewsModel = newValue[j] as! NewsModel
//                    if (news.thumbnail_mpic != nil) {
//                        var newsmodeler = NewsModel()
//                        
//                        newsmodeler = newValue[j] as! NewsModel
//                        newValue[j] = newValue[j + 1]
//                        newValue[j + 1] = newsmodeler
//                    }
//                }
//            }
            self.contentViewArray = [self.contentView1, self.contentView2, self.contentView3, self.contentView4, self.contentView5, self.contentView6]
            self.titleArray = [self.titleLB1, self.titleLB2, self.titleLB3, self.titleLB4, self.titleLB5, self.titleLB6]
            
            let count = newValue.count
            var titleLabel = UILabel()
            var view = UIView()
            var news = NewsModel()
            
            for var i = 0; i < count; i++ {
                news = newValue[i] as! NewsModel
                view = contentViewArray![i]
                view.layer.borderWidth = 0.25
                view.layer.borderColor = UIColor.lightGrayColor().CGColor
                if (news.title != nil) {
                    titleLabel = self.titleArray[i]
                    titleLabel.text = news.title
                }
                if i == 0 {
                    
                    if (news.thumbnail_mpic != nil) {
                        
                        self.imageview.sd_setImageWithURL(NSURL(string: news.thumbnail_mpic), placeholderImage: UIImage(named: "quesheng"))
                    }
                    
                }
                
                
            }
            
        }
        
        
    }
    
    
    
    
    
     override func layoutSubviews() {
        
        super.layoutSubviews()
        
        if self.contentViewArray == nil{
        self.contentViewArray = [self.contentView1, self.contentView2, self.contentView3, self.contentView4, self.contentView5, self.contentView6]
        }
        
        
        if self.titleArray == nil{
        self.titleArray = [self.titleLB1, self.titleLB2, self.titleLB3, self.titleLB4, self.titleLB5, self.titleLB6]
        }
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
