//
//  LMLNonetAnimationPlaceholderView.swift
//  LMLNonetAnimationPlaceholderView
//
//  Created by leo on 16/11/16.
//  Copyright © 2016年 leo. All rights reserved.
//



import UIKit

let Screen_width:CGFloat = UIScreen.main.bounds.size.width  //屏幕宽度
let Screen_height:CGFloat = UIScreen.main.bounds.size.height

class LMLNonetAnimationPlaceholderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var contentViewBackColor:UIColor = UIColor.init(white: 200.0 / 255.0, alpha: 1.0)
    var placeholderColor:UIColor = UIColor.init(white: 102.0 / 255.0, alpha: 1.0)
    var label_info: String = "没有连接到网络，请检查网络！"
    var pla_img_arr: [String]?
    
    var duration:CGFloat = 2.0
    var aniRepeatCount = 0  // 0代表永远
    
    var addView:UIView?  // 添加到的view
    
    var img_width:CGFloat = 100.0
    
    var click_closure: (() -> Void)?  // 点击self回调，可以做检查网路
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        
        self.frame = frame
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension LMLNonetAnimationPlaceholderView {

    /**
     * info: 信息
     * imageArray: 图片数组
     * toView: 添加到哪个view
     */
    func showNonetView(_ info: String, imageArray:[String], toView:UIView)  {
        
        label_info = info
        pla_img_arr = imageArray
        addView = toView
        
        self.bounds = toView.bounds
        self.alpha = 1
        self.backgroundColor = UIColor.init(white: 245.0 / 255.0, alpha: 1.0)
        
        let img: UIImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: img_width, height: img_width))
        
       // img.center =
        
        let label_height:CGFloat = 20
        
        let info_label: UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: (addView?.frame.size.width)!, height: label_height))
        info_label.text = label_info
        info_label.textColor = placeholderColor
        info_label.center = CGPoint.init(x: self.center.x, y: self.center.y + 5)
        info_label.textAlignment = NSTextAlignment.center
        info_label.font = UIFont.init(name: "Helvetica", size: 14)
        
        self.addSubview(info_label)
        
        let center_img: CGPoint = CGPoint.init(x: (addView?.center.x)!, y: (addView?.center.y)! - label_height / 2.0 - img_width / 2.0 )
        
        img.center = center_img
        img.contentMode = .scaleAspectFit
        
        self.addSubview(img)
        
        var img_arr:[UIImage] = [UIImage]()
        for item:String in imageArray {
            
            img_arr.append(UIImage.init(named: item)!)
        }
        
        img.animationImages = img_arr
        img.animationDuration = TimeInterval(duration)  // 播放间隔
        img.animationRepeatCount = aniRepeatCount //  循环次数
        img.startAnimating()
        
        addView?.addSubview(self)
        
        // 给self添加手势闭包回调
        let tapGes: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(didTapSelf))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGes)
    }
    
    func hide() {
    
        
        
        UIView.animate(withDuration: 1, animations: {()in
        
            
            if (self.superview != nil) {
            
                self.alpha = 0
                self.removeFromSuperview()
            }
            
        }, completion: {(bool) in
            
            
        })
    }
    
    func didTapSelf() {
        
        if (click_closure != nil) {
            self.click_closure!() // 执行
        }
    }
    
}





