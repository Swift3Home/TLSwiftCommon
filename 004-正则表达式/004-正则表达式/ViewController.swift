//
//  ViewController.swift
//  004-正则表达式
//
//  Created by lichuanjun on 2017/8/3.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let array = ["red": UIColor.red,
//                     "green": UIColor.green,
//                     "yellow": UIColor.yellow,
//                     "blue": UIColor.blue,
//                     "black": UIColor.black,
//                     "brown": UIColor.brown,
//                     "orange": UIColor.orange,
//                     "white": UIColor.white,
//                     "gray": UIColor.gray,
//                     ]
        
        
//        "(.*?)": UIColor\.(.*?),
//        "$2": UIColor\.$2,
        
        
        // 1. "<a href="http://app.weibo.com/t/feed/6ghA0p" rel="nofollow">搜狗高速浏览器</a>"
        // 目标：去除字符串
        let string = "<a href=\"http://app.weibo.com/t/feed/6ghA0p\" rel=\"nofollow\">搜狗高速浏览器</a>"
        
        // 2. 创建正则表达式
        // 0> pattern - 匹配方案
        let pattern = "<a href=\"http://app.weibo.com/t/feed/6ghA0p\" rel=\"nofollow\">搜狗高速浏览器</a>"
        // 1> 创建正则表达式, 如果 pattern 失败，抛出异常
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []) else {
            return
        }
        
        // 2> 进行查找，两种查找方式
        // 只找第一个匹配项 / 查找多个匹配项
        guard let result = regx.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.characters.count)) else {
            print("没有找到匹配项")
            return
        }
        
        // 3> result 中只有两个重要的方法
        // result.numberOfRanges -> 查找到的范围数量
        // result.range(at: idx) -> 指定`索引`位置的范围
        print("找到的数量 \(result.numberOfRanges)")
        
        for idx in 0..<result.numberOfRanges {
            print(result.rangeAt(idx))
            let r = result.rangeAt(idx)
            let subStr = (string as NSString).substring(with: r)
            
            print(subStr)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

