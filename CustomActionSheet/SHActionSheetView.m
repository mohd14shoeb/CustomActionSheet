//
//  WDActionSheetView.m
//  IOS-WeidaiCreditLoan
//
//  Created by yaoqi on 16/4/11.
//  Copyright © 2016年 . All rights reserved.
//

#import "Masonry.h"
#import "SHActionSheetView.h"

#define RGBA(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:a]
#define RGB(r, g, b) RGBA(r, g, b, 1.0)
#define MainRGBColor RGB(68, 178, 247)

@interface SHActionSheetView ()

@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, copy) void (^sureBlock)(void);
@property (nonatomic, copy) void (^cancelBlock)(void);

@end

@implementation SHActionSheetView

+ (id)sh_actionSheet {
    return [[self alloc] init];
}

- (void)sh_addSureButtonTitle:(NSString *)title addSureButtonTitle:(NSString *)sureButtonTitle addCancelButtonTitle:(NSString *)CancelButtonTitle sureHandler:(void (^)(void))sureBlock cancelHandler:(void (^)(void))cancelBlock {
    self.sureBlock = sureBlock;
    self.cancelBlock = cancelBlock;

    UIWindow *window = [UIApplication sharedApplication].keyWindow;

    self.maskView = [[UIView alloc] initWithFrame:window.bounds];
    self.maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    [window addSubview:self.maskView];

    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = 3.f;
    [window addSubview:contentView];
    self.containerView = contentView;
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.maskView);
        make.height.mas_equalTo(210);
        make.leading.equalTo(self.maskView);
        make.top.equalTo(self.maskView.mas_bottom);
    }];

    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setBackgroundColor:MainRGBColor];
    cancelButton.layer.cornerRadius = 3.0;
    [cancelButton setTitle:CancelButtonTitle forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:cancelButton];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(5);
        make.trailing.mas_equalTo(-5);
        make.height.mas_equalTo(40);
        make.bottom.equalTo(contentView.mas_bottom).offset(-20);
    }];

    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [sureButton setBackgroundColor:MainRGBColor];
    sureButton.layer.cornerRadius = 3.0;
    [sureButton setTitle:sureButtonTitle forState:UIControlStateNormal];
    [sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(sureButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:sureButton];
    [sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.height.equalTo(cancelButton);
        make.bottom.equalTo(cancelButton.mas_top).offset(-20);
    }];

    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setText:title];
    [titleLabel setFont:[UIFont systemFontOfSize:14.f]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:RGB(162, 44, 206)];
    [titleLabel setNumberOfLines:0];
    [contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(sureButton);
        make.top.equalTo(contentView.mas_top).offset(20);
        make.bottom.equalTo(sureButton.mas_top).offset(-20);
    }];
    [window addSubview:self];
    self.alpha = 0;
    [self showAnimation];
}

#pragma mark - Action Event
- (void)cancelButtonClicked:(UIButton *)button {
    [self hideAnimation];
    if (self.cancelBlock) {
        self.cancelBlock();
    }
}

- (void)sureButtonClicked:(UIButton *)button {
    [self hideAnimation];
    if (self.sureBlock) {
        self.sureBlock();
    }
}

#pragma mark - 动画显示和隐藏
- (void)showAnimation {
    [UIView animateWithDuration:0.25 animations:^{
        [self.containerView.layer setValue:@-210.0 forKeyPath:@"transform.translation.y"];
        self.maskView.alpha = 1;
        self.containerView.alpha = 1;
        self.alpha = 1;
    }
        completion:^(BOOL finished){

        }];
}

- (void)hideAnimation {
    [UIView animateWithDuration:0.25 animations:^{
        [self.containerView.layer setValue:@210.0 forKeyPath:@"transform.translation.y"];
        self.alpha = 0;
        self.maskView.alpha = 0;
        self.containerView.alpha = 0;
    }
        completion:^(BOOL finished) {
            [self removeFromSuperview];
            [self.maskView removeFromSuperview];
            [self.containerView removeFromSuperview];
        }];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
