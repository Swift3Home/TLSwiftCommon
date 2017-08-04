//
//  TLEmoticonManager
//  006-表情包数据
//
//  Created by lichuanjun on 2017/8/4.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

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
            // 方法一：
//            let result = p.emoticons.filter({ (em) -> Bool in
//                return em.chs == string
//            })
            // 方法二：尾随闭包
//            let result = p.emoticons.filter() { (em) -> Bool in
//                return em.chs == string
//            }
            // 方法三：如果闭包中只有一句，并且是返回
            // 1> 闭包格式定义可以省略
            // 2> 参数省略之后，使用 $0,$1... 依次替代原有的参数
//            let result = p.emoticons.filter() {
//                return $0.chs == string
//            }
            // 方法四：如果闭包中只有一句，并且是返回
            // 1> 闭包格式定义可以省略
            // 2> 参数省略之后，使用 $0,$1... 依次替代原有的参数
            // 3> return 也可以省略
            let result = p.emoticons.filter() { $0.chs == string }
            
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

// MARK: - 表情字符串的处理
extension TLEmoticonManager {
    
    /// 将给定的字符串转换成属性文本
    ///
    /// 关键点：要按照匹配结果倒序替换属性文本
    ///
    /// - Parameter string: 完整的字符串
    /// - Returns: 属性文本
    func emoticonsString(string: String, font: UIFont) -> NSAttributedString {
        
        let attrString = NSMutableAttributedString(string: string)
        // 1.建立正则表达式，过滤所有的表情文字
        let pattern = "\\[.*?\\]"
        guard let regx =  try? NSRegularExpression(pattern: pattern, options: []) else {
            return attrString
        }
        // 2. 匹配所有项
        let matchs = regx.matches(in: string, options: [], range: NSRange(location: 0, length: attrString.length))
        
        // 3. 遍历所有匹配结果
        for m in matchs.reversed() {
            
            let r = m.rangeAt(0)
            let subStr = (attrString.string as NSString).substring(with: r)
            
            // 1> 使用 subStr 查找对应的表情符号
            if let em = TLEmoticonManager.shared.findEmoticon(string: subStr) {
                
                // 2> 使用表情符号中的属性文本，替换原有的属性文本的内容
                attrString.replaceCharacters(in: r, with: em.imageText(font: font))
            }
        }
        
        // 4. 统一设置一遍字符串的属性
        attrString.addAttributes([NSFontAttributeName: font], range: NSRange(location: 0, length: attrString.length))
        return attrString
    }
    
}
