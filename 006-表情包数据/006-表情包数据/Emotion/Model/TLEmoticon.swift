//
//  TLEmoticon.swift
//  006-表情包数据
//
//  Created by lichuanjun on 2017/8/4.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit
import YYModel

// 表情模型
class TLEmoticon: NSObject {

    // 表情类型 false - 图片表情 / true - emoji
    var type = false
    // 表情字符串，发送给新浪微博的服务器(节约流量)
    var chs: String?
    // 表情图片名，用于本地图文混排
    var png: String?
    // emoji 的十六进制编码
    var code: String?
    
    override var description: String {
        return yy_modelDescription()
    }
}
