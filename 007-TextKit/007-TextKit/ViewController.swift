//
//  ViewController.swift
//  007-TextKit
//
//  Created by lichuanjun on 2017/8/6.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: TLLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "请点 http://www.baidu.com"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

