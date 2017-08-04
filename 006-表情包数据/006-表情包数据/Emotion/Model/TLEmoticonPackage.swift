//
//  TLEmoticonPackage.swift
//  006-表情包数据
//
//  Created by lichuanjun on 2017/8/4.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit
import YYModel

// 表情包模型
class TLEmoticonPackage: NSObject {

    // 表情包的分组名
    var groupName: String?
    // 表情包目录，从目录下加载 info.plist 可以创建表情模型数组
    var directory: String? {
        didSet {
            // 当设置目录时，从目录下加载 info.plist
            guard let directory = directory,
                let path = Bundle.main.path(forResource: "TLEmoticon.bundle", ofType: nil),
                let bundle = Bundle(path: path),
                let infoPath = bundle.path(forResource: "info.plist", ofType: nil, inDirectory: directory),
                let array = NSArray(contentsOfFile: infoPath) as? [[String: String]],
                let models = NSArray.yy_modelArray(with: TLEmoticon.self, json: array) as? [TLEmoticon]
                else {
                return
            }
            
            // 遍历 models 数组，设置每一个表情符号的目录
            for m in models {
                m.directory = directory
            }
            
            // 设置表情模型数组
            emoticons += models
        }
    }
    
    // 懒加载的表情模型空数组
    // 使用懒加载可以避免后续的解包
    lazy var emoticons = [TLEmoticon]()
    
    override var description: String {
        return yy_modelDescription()
    }
}
