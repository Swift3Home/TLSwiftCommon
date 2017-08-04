//
//  TLEmoticonManager
//  006-表情包数据
//
//  Created by lichuanjun on 2017/8/4.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import Foundation

/// 表情管理器
class TLEmoticonManager {
    
    // 为了便于表情的复用，建立一个单例，只加载一次表情数据
    // 表情管理器的单例实例
    static let shared = TLEmoticonManager()
    
    /// 构造函数,如果在 init 之前增加 private 修饰符，可以要求调用者必须通过 shared 访问对象
    private init() {
        loadPackages()
    }
}

// MARK: - 表情包数据处理

private extension TLEmoticonManager {
    
    func loadPackages() {
        // 读取emotions.plist
        guard let path = Bundle.main.path(forResource: "TLEmoticon.bundle", ofType: nil),
            let bundle = Bundle(path: path),
            let plistPath = bundle.path(forResource: "emoticons.plist", ofType: nil),
            let array = NSArray(contentsOfFile: plistPath) as? [String: String]
            else {
                return
        }
        
        print(array)
    }
    
}
