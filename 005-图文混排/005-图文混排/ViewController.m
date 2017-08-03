//
//  ViewController.m
//  005-图文混排
//
//  Created by lichuanjun on 2017/8/3.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

// 目标：我 [爱你]
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1> Attachment - 附件
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:@"d_aini"];
    CGFloat height = self.label.font.lineHeight;
    attachment.bounds = CGRectMake(0, -4, height, height);
    
    // 2> 图像字符串
    NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:attachment];
    
    // 3> 定义一个可变的属性字符串
    NSMutableAttributedString *attrStrM = [[NSMutableAttributedString alloc] initWithString:@"我"];
    
    // 4> 拼接字符串
    [attrStrM appendAttributedString:imageStr];
    [attrStrM appendAttributedString:[[NSAttributedString alloc] initWithString:@"88!"]];
    
    // 5> 设置属性文本
    self.label.attributedText = attrStrM;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
