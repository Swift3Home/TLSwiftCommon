//
//  TLRefreshView.swift
//  003-刷新控件
//
//  Created by lichuanjun on 2017/7/31.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit


/// 刷新视图 - 负责刷新相关的 UI 显示和动画
class TLRefreshView: UIView {
    
    /// 刷新状态
    var refreshState: TLRefreshState = .Normal
    
    /// 指示器
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    /// 提示图标
    @IBOutlet weak var tipIcon: UIImageView!
    /// 提示标签
    @IBOutlet weak var tipLabel: UILabel!

    class func refreshView() -> TLRefreshView {
        
        let nib = UINib(nibName: "TLRefreshView", bundle: nil)
        
        return nib.instantiate(withOwner: nil, options: nil)[0] as! TLRefreshView
    }
}
