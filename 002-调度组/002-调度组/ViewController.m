//
//  ViewController.m
//  002-调度组
//
//  Created by lichuanjun on 2017/7/25.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self group2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**  C语言
 void
 dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
 {
    // 替代dispatch对象常规的retain来持有对象，但ARC编程中不再允许
    dispatch_retain(group);
 
    // 入组
    dispatch_group_enter(group);
 
    // 由 queue 调度 block 异步执行
    dispatch_async(queue, ^{
 
        // 执行准备好的 block
        block();
        
        // 出租 - 要和入组配对出现
        dispatch_group_leave(group);
 
        // 替代dispatch对象常规的release来释放对象，同样ARC编程中不再允许
        dispatch_release(group);
    });
 }
 */
-(void)group2 {
    // 1. 创建调度组
    dispatch_group_t group = dispatch_group_create();
    
    // 2.队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);

    // 3. 调度组
    /**
     1) 调度组没有任务，直接执行 notify
     2) 入组多于出组，notify 永远不会执行，因为组永远不会为空
     3) 出组多于入组，会崩溃
     
     注意：入组和出组要配对出现
     */
    // 1> 入组
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        NSLog(@"download A %@", [NSThread currentThread]);
        
        // 2> 出组
        dispatch_group_leave(group);
    });
    
    
    // 1> 入组
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1.0];
        
        NSLog(@"download B %@", [NSThread currentThread]);
        
        // 2> 出组
        dispatch_group_leave(group);
    });
    
    // 4. 监听
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"come here %@", [NSThread currentThread]);
    });
}

/**
 *  调度组最重要的目的 - 监听一组任务完成
 */
-(void)group1 {
    // 1. 创建调度组
    dispatch_group_t group = dispatch_group_create();
    
    // 2.队列
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    
    // 3. 调度组监听队列调度任务
    dispatch_group_async(group, q, ^{
        NSLog(@"download A %@", [NSThread currentThread]);
    });
    
    dispatch_group_async(group, q, ^{
        NSLog(@"download B %@", [NSThread currentThread]);
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"come here %@", [NSThread currentThread]);
    });
    
}

@end
