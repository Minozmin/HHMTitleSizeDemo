//
//  ViewController.m
//  HHMTitleSizeDemo
//
//  Created by Hehuimin on 2017/9/26.
//  Copyright © 2017年 haoshiqi. All rights reserved.
//

#import "ViewController.h"
#import "NSString+TitleSize.h"

#define kWidth ([UIScreen mainScreen].bounds.size.width - (375 - 335))

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *labelContent;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *constraintLabelContentHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *string = @"方法2：比方法1多了限制行数功能，但是这里有个bug。如果限制的行数小于所有行数，并且设置了行间距的话，这时候计算出来的高度会多出一点来（1倍的行间距），但是小于这个高度的话UILabel就不能正常显示要限制的行数，这就很费解了，希望知道的朋友帮助解决这个问题。";
    
    //行间距
    CGFloat lineSpacing = 10;
    //限制行数
    int limitNumbers = 5;
    UIFont *font = [UIFont systemFontOfSize:14.0];

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //numberOfLines的行数跟limitNumbers一样时，都设置为1时显示会有问题，所以1行时最好不要加行间距
    paragraphStyle.lineSpacing = (limitNumbers > 1) ? lineSpacing : 0;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, string.length)];
    self.labelContent.attributedText = attributedString;
    self.labelContent.numberOfLines = 0;
    self.labelContent.backgroundColor = [UIColor redColor];
    //结尾部分的内容以……方式省略，显示头的文字内
    self.labelContent.lineBreakMode = NSLineBreakByTruncatingTail;
    self.labelContent.font = font;
    CGFloat height = [NSString heightText:string inWidth:kWidth font:font lineSpacing:lineSpacing lines:limitNumbers];
    self.constraintLabelContentHeight.constant = height;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.labelContent.preferredMaxLayoutWidth = kWidth;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
