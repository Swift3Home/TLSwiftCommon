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

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        testEmoticons()
        
        // 目标：我[爱你]啊[笑哈哈]！
        let string = "我[爱你]啊[笑哈哈]！"
        
        label.attributedText = emoticonsString(string: string)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /// 将给定的字符串转换成属性文本
    ///
    /// - Parameter string: 完整的字符串
    /// - Returns: 属性文本
    func emoticonsString(string: String) -> NSAttributedString {
        
        let attrString = NSAttributedString(string: string)
        // 1.建立正则表达式，过滤所有的表情文字
        let pattern = "\\[.*?\\]"
        guard let regx =  try? NSRegularExpression(pattern: pattern, options: []) else {
            return attrString
        }
        // 2. 匹配所有项
        let matchs = regx.matches(in: string, options: [], range: NSRange(location: 0, length: attrString.length))
        
        // 3. 遍历所有匹配结果
        for m in matchs {
            
            let r = m.rangeAt(0)
            let subStr = (attrString.string as NSString).substring(with: r)
            print(subStr)
        }
        
        return attrString
    }
    
    func testEmoticons() {
        // --- 测试单例 ---
        let m1 = TLEmoticonManager.shared
        print(m1.packages)
        
        // --- 测试表情图像 ---
        print(TLEmoticonManager.shared.packages.last?.emoticons.first?.image ?? "")
        print(TLEmoticonManager.shared.packages.last?.emoticons.first ?? "")
        
        // --- 测试查找表情 ---
        print(TLEmoticonManager.shared.findEmoticon(string: "[马上有对象]") ?? "")
        
        // --- 测试直接生成表情属性文本 ---
        let em = TLEmoticonManager.shared.findEmoticon(string: "[马上有对象]")
        label.attributedText = em?.imageText(font: label.font)
    }
}

