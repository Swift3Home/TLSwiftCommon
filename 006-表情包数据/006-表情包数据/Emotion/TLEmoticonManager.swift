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
    
    lazy var packages = [TLEmoticonPackage]()
    
    /// 构造函数,如果在 init 之前增加 private 修饰符，可以要求调用者必须通过 shared 访问对象
    private init() {
        loadPackages()
    }
}

// MARK: - 表情符号处理
extension TLEmoticonManager {
    
    /// 根据 string 在所有的表情符号中查找对应的表情模型对象
    ///
    /// - Parameter string: 表情模型字符串
    /// - Returns: 如果找到，返回表情模型；否则，返回nil
    func findEmoticon(string: String) -> TLEmoticon? {
        // 1. 遍历表情包
        for p in packages {
            // 2. 在表情数组中过滤 string
            let result = p.emoticons.filter({ (em) -> Bool in
                return em.chs == string
            })
            
            // 3. 判断结果数组的数量
            if result.count == 1 {
                return result[0]
            }
        }
        
        return nil
    }
}

// MARK: - 表情包数据处理
private extension TLEmoticonManager {
    
    func loadPackages() {
        // 读取emotions.plist
        guard let path = Bundle.main.path(forResource: "TLEmoticon.bundle", ofType: nil),
            let bundle = Bundle(path: path),
            let plistPath = bundle.path(forResource: "emoticons.plist", ofType: nil),
            let array = NSArray(contentsOfFile: plistPath) as? [[String: String]],
            let models = NSArray.yy_modelArray(with: TLEmoticonPackage.self, json: array) as? [TLEmoticonPackage]
            else {
                return
        }
        // 设置表情包数据
        packages += models
    }
    
}
