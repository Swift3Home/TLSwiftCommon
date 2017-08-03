//
//  String+Extensions.swift
//  004-正则表达式
//
//  Created by lichuanjun on 2017/8/3.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import Foundation

extension String {
    
    /// 从当前字符串中，提取连接和文本
    ///
    /// - Returns: 元组类型 连接和文本
    func tl_href() -> (link: String, text: String)? {
        
        // 0.匹配方案
        let pattern = "<a href=\"(.*?)\".*?>(.*?)</a>"
        
        // 1. 创建正则表达式，并且匹配第一项
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []),
            let result = regx.firstMatch(in: self, options: [], range: NSRange(location: 0, length: characters.count)) else {
            return nil
        }
        
        // 2.获取结果
        let link = (self as NSString).substring(with: result.rangeAt(1))
        let text = (self as NSString).substring(with: result.rangeAt(2))
        
        return (link, text)
    }
}
