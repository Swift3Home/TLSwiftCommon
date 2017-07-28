//
//  ViewController.swift
//  001-图像的优化
//
//  Created by lichuanjun on 2017/7/19.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    // 如何设置圆角，不要用圆角半径
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 0, y: 0, width: 160, height: 160)
        let iv = UIImageView(frame: rect)
        
        iv.center = view.center
        
        view.addSubview(iv)
        
        // 设置图像
        // - PNG 图片是支持透明的
        // - JPG 图片不支持透明
//        let image = #imageLiteral(resourceName: "avatar_default_big.png")
//        iv.image = avatarImage(image: image, size: rect.size, backColor: view.backgroundColor)
        
        let image = UIImage(named: "shali.jpg")//#imageLiteral(resourceName: "shali.jpg")
        iv.image = avatarImage(image: image!, size: rect.size, backColor: view.backgroundColor)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func avatarImage(image: UIImage, size: CGSize, backColor: UIColor?) -> UIImage? {
        let rect = CGRect(origin: CGPoint(), size: size)
        
        // 1. 图像的上下文 - 内存中开辟一个地址，跟屏幕无关
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        
        // 0> 背景填充
        backColor?.setFill()
        UIRectFill(rect)
        
        // 1> 实例化一个圆形的路径
        let path = UIBezierPath(ovalIn: rect)
        // 2> 进行路径裁切 - 后续的绘图，都会出现在圆形路径内部，外部的全部干掉
        path.addClip()
        
        // 2. 绘图 drawInRect 就是在指定区域内拉伸屏幕
        image.draw(in: rect)
        
        // 3. 绘制内切的圆形
        UIColor.darkGray.setStroke()
        path.lineWidth = 2
        path.stroke()
        
        // 4.取得结果
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        // 5. 关闭上下文
        UIGraphicsEndImageContext()

        // 6. 返回结果
        return result
    }
}

