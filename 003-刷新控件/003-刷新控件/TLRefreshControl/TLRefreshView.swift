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
    /**
     iOS 系统中 UIView 封装的旋转动画
     - 默认顺时针旋转
     - 就近原则
     - 要想实现同方向旋转，需要调整一个，非常小的数字(近)
     - 要想实现 360度旋转，需要核心动画 CABaseAnimation
     */
    var refreshState: TLRefreshState = .Normal {
        didSet {
            switch refreshState {
            case .Normal:
                // 恢复状态
                tipIcon.isHidden = false
                indicator.stopAnimating()
                
                tipLabel.text = "继续使劲拉..."
                UIView.animate(withDuration: 0.25){
                    self.tipIcon.transform = CGAffineTransform.identity
                }
                break
            case .Pulling:
                tipLabel.text = "放手就刷新..."
                UIView.animate(withDuration: 0.25){
                    self.tipIcon.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi + 0.001))
                }
                break
            case .WillRefresh:
                tipLabel.text = "正在刷新中..."
                // 隐藏提示图标
                tipIcon.isHidden = true
                
                // 显示菊花
                indicator.startAnimating()
                
                break
            }
        }
    }
    
    /// 指示器
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    /// 提示图标
    @IBOutlet weak var tipIcon: UIImageView!
    /// 提示标签
    @IBOutlet weak var tipLabel: UILabel!

    class func refreshView() -> TLRefreshView {
        
        let nib = UINib(nibName: "TLHumanRefreshView", bundle: nil)
        
        return nib.instantiate(withOwner: nil, options: nil)[0] as! TLRefreshView
    }
}
