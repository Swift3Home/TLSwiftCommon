//
//  ViewController.swift
//  006-表情包数据
//
//  Created by lichuanjun on 2017/8/3.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

/**
 1.黄色文件夹：编译后，资源文件在 mainBundle 中，源代码程序需要通过这种方式拖拽添加需要
    - 注意不能出现重名的文件
    - 效率高
 2.蓝色文件夹：编译后，资源文件在 mainBundle 中的对应文件夹中，游戏文件的素材一般通过这种方式拖拽添加
    - 允许出现重名文件
    - 用于换肤应用
    - 效率略差
 3.白色 Bundle：编译后，资源文件在 mainBundle 中仍然以包的形式存在，可以路径形式访问
    - 允许出现重名文件
    - 拖拽文件更简单
    - 主要用于第三方框架包装资源素材
 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

