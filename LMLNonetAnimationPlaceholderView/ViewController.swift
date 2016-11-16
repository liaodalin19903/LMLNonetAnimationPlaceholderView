//
//  ViewController.swift
//  LMLNonetAnimationPlaceholderView
//
//  Created by leo on 16/11/16.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    func initUI() {
        
        
    }

    @IBAction func clickMe(_ sender: UIButton) {
        
        let lml_place = LMLNonetAnimationPlaceholderView.init(frame: self.view.bounds)
        
        let imgs = [
            "deer1",
            "deer2",
            "deer3"
        ]
        
        
        lml_place.showNonetView("没有连接到网络，心里空空的...", imageArray: imgs, toView: self.view)
        lml_place.click_closure = {
            
            // 1.点击了PlaceView, 请检查网络
            
            // 2.如果有网络之后，就关闭掉placeholderView
            lml_place.hide()
        }
    }

}

