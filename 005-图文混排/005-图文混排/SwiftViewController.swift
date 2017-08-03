//
//  SwiftViewController.swift
//  005-图文混排
//
//  Created by lichuanjun on 2017/8/3.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

// 目标：我 [爱你]99!

class SwiftViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 0> 图片附件
        let attachment = NSTextAttachment()
        attachment.image = #imageLiteral(resourceName: "d_aini")
        
        let height = label.font.lineHeight
        attachment.bounds = CGRect(x: 0, y: -4, width: height, height: height)
        
        // 1> 属性文本
        let imageStr = NSAttributedString(attachment: attachment)
        
        // 2> 图文字符串
        let attrStrM = NSMutableAttributedString(string: "我")
        attrStrM.append(imageStr)
        attrStrM.append(NSAttributedString(string: "99!"))
        
        // 3> 设置 label
        label.attributedText = attrStrM
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
