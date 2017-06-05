//
//  ViewController.m
//  CocoaPodsTest
//
//  Created by mac on 17/6/5.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

#define SCREEN_Width    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_Height   ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation ViewController

#pragma mark -懒加载
- (UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.backgroundColor = [UIColor purpleColor];
    }
    return _imgView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self createUI];
    
}

#pragma mark -
- (void)createUI
{
    [self.view addSubview:self.imgView];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.leading.mas_equalTo((SCREEN_Width - 100)/2.0);
        make.top.mas_equalTo(100);
    }];
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:@"http://img01.taopic.com/141128/240418-14112PU24867.jpg"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
        if (error) {
            NSLog(@"error: %@", error);
            return ;
        }
        
        NSLog(@"completed");
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
