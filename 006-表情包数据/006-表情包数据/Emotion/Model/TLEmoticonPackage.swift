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
    var directory: String?
    
    // 懒加载的表情模型空数组
    // 使用懒加载可以避免后续的解包
    lazy var emticons = [TLEmoticon]()
    
    override var description: String {
        return yy_modelDescription()
    }
}
