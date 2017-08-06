//
//  TLLabel.swift
//  007-TextKit
//
//  Created by lichuanjun on 2017/8/6.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

/**
 1. 使用 TextKit 接管 Label 的底层实现 - 绘制 textStorage 的文本内容
 2. 使用正则表达式过滤 URL
 3. 交互
 */
class TLLabel: UILabel {

    // MARK: - 构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareTextSystem()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        prepareTextSystem()
    }
    
    /// 绘制文本
    override func drawText(in rect: CGRect) {
        let range = NSRange(location: 0, length: textStorage.length)
        
        layoutManager.drawGlyphs(forGlyphRange: range, at: CGPoint())
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 指定绘制文本的区域
        textContainer.size = bounds.size
    }
    
    // MARK: - TextKit 的核心对象
    
    /// 属性文本存储
    fileprivate lazy var textStorage = NSTextStorage()
    /// 负责文本`字形`布局
    fileprivate lazy var layoutManager = NSLayoutManager()
    /// 设定文本绘制的范围
    fileprivate lazy var  textContainer = NSTextContainer()
}

// MARK: - 设置 TextKit 核心对象
private extension TLLabel {
    
    // 准备文本系统
    func prepareTextSystem() {
        // 1. 准备文本内容
        prepareTextContent()
        
        // 2. 设置对象的关系
        textStorage.addLayoutManager(layoutManager)
        layoutManager.addTextContainer(textContainer)
    }
    
    /// 准备文本内容 - 使用 textStorage 结果 label 的内容
    func prepareTextContent() {
        
        if let attributedText = attributedText {
            textStorage.setAttributedString(attributedText)
        } else if let text = text {
            textStorage.setAttributedString(NSAttributedString(string: text))
        } else {
            textStorage.setAttributedString(NSAttributedString(string: ""))
        }
    }
}
