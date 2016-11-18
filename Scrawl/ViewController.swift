//
//  ViewController.swift
//  Scrawl
//
//  Created by wind on 2016/11/18.
//  Copyright © 2016年 wind. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DrawViewDelegate {
    
    var backBtn:UIButton?
    var forwardBtn:UIButton?
    var drawView:DrawView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //构建画板
        let drawView = DrawView.init(frame: CGRect.init(x: 0, y: 150, width: self.view.frame.size.width, height: self.view.frame.size.height - 100));
        drawView.layer.borderWidth = 1;
        drawView.delegate = self
        self.view.addSubview(drawView)
        self.drawView = drawView
        
        //回退 和 撤销按钮
        let backBtn = UIButton.init()
        backBtn.frame = CGRect.init(x: 10, y: 20, width: 50, height: 50)
        backBtn.setTitle("撤销", for: .normal)
        backBtn.backgroundColor = UIColor.gray
        backBtn.setTitleColor(.black, for: .normal)
        backBtn.addTarget(self, action: #selector(ViewController.backBtnClicked), for: .touchUpInside)
        self.view.addSubview(backBtn)
        self.backBtn = backBtn
        self.backBtn!.isEnabled = false
        
        let forwardBtn = UIButton.init()
        forwardBtn.frame = CGRect.init(x: 130, y: 20, width: 50, height: 50)
        forwardBtn.setTitle("回退", for: .normal)
        forwardBtn.backgroundColor = UIColor.gray
        forwardBtn.setTitleColor(.black, for: .normal)
        forwardBtn.addTarget(self, action: #selector(ViewController.forwardBtnClicked), for: .touchUpInside)
        self.view.addSubview(forwardBtn)
        self.forwardBtn = forwardBtn
        self.forwardBtn!.isEnabled = false
    }
    
    
    /*
     *  btn clicked
     */
    func backBtnClicked() {
        self.backBtn!.isEnabled = (self.drawView?.backToLastStep())!
        self.forwardBtn!.isEnabled = true
    }
    
    func forwardBtnClicked() {
        self.forwardBtn!.isEnabled = (self.drawView?.forwardNextStep())!
        self.backBtn!.isEnabled = true
    }
    
    /*
     *  DrawViewDelegate
     */
    func beginDraw() {
        self.backBtn!.isEnabled = true
        self.forwardBtn!.isEnabled = false
        
    }
    
    /*
     *  获取涂鸦相对于涂鸦版的范围
     *  
     *  self.drawView?.getDrawRect()
     */
    
    /*
     *  设置涂鸦的颜色和粗细
     *
     *  self.drawView?.penColor = .red
     *  self.drawView?.penWidth = 10.0
     */
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

