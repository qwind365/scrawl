# scrawl
simple ScrawlView, can select color and lineWidth custom ,support undo and redo actions ,can get draw rect finished

         //构建画板
        let drawView = DrawView.init(frame: CGRect.init(x: 0, y: 150, width: self.view.frame.size.width, height: self.view.frame.size.height - 100));
        drawView.layer.borderWidth = 1;
        drawView.delegate = self
        self.view.addSubview(drawView)
        self.drawView = drawView
        
        //撤销  返回是否还能撤销
        self.drawView?.backToLastStep()
        
        //回退  返回是否还能回退
        self.drawView?.forwardNextStep()
        
        /*
        *  DrawViewDelegate   开始画
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
