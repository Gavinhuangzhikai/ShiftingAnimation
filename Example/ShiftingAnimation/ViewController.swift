//
//  ViewController.swift
//  ShiftingAnimation
//
//  Created by 395168452@qq.com on 10/23/2019.
//  Copyright (c) 2019 395168452@qq.com. All rights reserved.
//

import UIKit
import ShiftingAnimation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view  = ShiftingView.init(frame: CGRect.init(x: 100, y: 100, width: 300, height: 400))
        self.view.addSubview(view)
        view.startFirstAnimaation()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

