//
//  TLRefreshControl.swift
//  TLWeibo
//
//  Created by lichuanjun on 2017/7/28.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

// 刷新控件
class TLRefreshControl: UIControl {

    // MARK: - 属性
    // 滚动视图的父视图，下拉刷新控件应该适用于 UITableView / UICollectionView
    private weak var scrollView: UIScrollView?
    
    // MARK: - 构造函数
    init() {
        super.init(frame: CGRect())
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
    }
    
    /**
     newSuperview: addSubView 方法会调用
     - 当添加到父视图时，newSuperview 是父视图
     - 当父视图被移除，newSuperview 是 nil
     */
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        // 判断父视图的类型
        guard let sv = newSuperview as? UIScrollView else {
            return
        }
        
        // 记录父视图
        scrollView = sv
        
        // KVO 监听父视图的 contentOffset
        scrollView?.addObserver(self, forKeyPath: "contentOffset", options: [], context: nil)
    }
    
    // 本视图从父视图上移除
    // 提示：所有的下拉刷新框架都是监听父视图的 contentOffset
    // 所有的框架的 KVO 监听实现思路都是这个
    override func removeFromSuperview() {
        // 移除 KVO 监听
        superview?.removeObserver(self, forKeyPath: "contentOffset")
        
        super.removeFromSuperview()
        
    }
    
    // 所有 KVO 方法会统一调用此方法
    // 在程序中，通常只监听某一个对象的某几个属性，如果属性太多，方法会很乱
    // 观察者模式，在不需要时，都需要释放
    // - 通知通知：如果不释放，什么也不会发生，但是会有内存泄露，会有多次注册的可能
    // - KVO：如不释放，会崩溃
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        // contentOffset 的 y 值与 contentInset 的 top 有关
//        print(scrollView?.contentOffset)
        
        guard let sv = scrollView else {
            return
        }
        
        // 初始高度是0
        let height = -(sv.contentInset.top + sv.contentOffset.y)
        
        // 可以根据高度设置刷新控件的 frame
        self.frame = CGRect(x: 0, y: -height, width: sv.bounds.width, height: height)
        print(height)
    }
    
    // 开始刷新
    func beginRefreshing() {
        
    }
    
    // 结束刷新
    func endRefreshing() {
        
    }
    
}


extension TLRefreshControl {
    
    fileprivate func setupUI() {
        backgroundColor = UIColor.orange
    }
    
}
