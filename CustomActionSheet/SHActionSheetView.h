//
//  WDActionSheetView.h
//  IOS-WeidaiCreditLoan
//
//  Created by yaoqi on 16/4/11.
//  Copyright © 2016年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHActionSheetView : UIView

+ (id)sh_actionSheet;
- (void)sh_addSureButtonTitle:(NSString *)title addSureButtonTitle:(NSString *)sureButtonTitle addCancelButtonTitle:(NSString *)CancelButtonTitle sureHandler:(void (^)(void))sureBlock cancelHandler:(void (^)(void))cancelBlock;

@end
