//
//  ViewController.swift
//  003-刷新控件
//
//  Created by lichuanjun on 2017/7/28.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    lazy var refreshControl: TLRefreshControl = TLRefreshControl()
    
    /**
     系统刷新控件的问题：
     1. 如果用户不放手，下拉到一定程度都会自动进入刷新状态，浪费流量
     2. 如果程序主动调用 beginRefreshing，不显示菊花
     
     自定义刷新控件，最重要解决的，就是用户放手，再刷新
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置 contentInset
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        
        // 添加刷新控件
        tableView.addSubview(refreshControl)
        
        // 监听方法
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
        // 主动刷新控件
        loadData()
    }

    func loadData() {
        
        print("开始刷新")
        refreshControl.beginRefreshing()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) { 
            
            print("结束刷新")
            
            self.refreshControl.endRefreshing()
        }
    }

}

