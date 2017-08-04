//
//  TLEmotionManager.swift
//  006-表情包数据
//
//  Created by lichuanjun on 2017/8/4.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import Foundation

/// 表情管理器
class TLEmotionManager {
    
    // 为了便于表情的复用，建立一个单例，只加载一次表情数据
    // 表情管理器的单例实例
    static let shared = TLEmotionManager()
    
    /// 构造函数,如果在 init 之前增加 private 修饰符，可以要求调用者必须通过 shared 访问对象
    private init() {
        
    }
}
