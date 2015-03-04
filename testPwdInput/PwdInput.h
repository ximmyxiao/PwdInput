//
//  PwdInput.h
//  testPwdInput
//
//  Created by Piao Piao on 15/3/3.
//  Copyright (c) 2015年 Piao Piao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PwdInputDelegate <NSObject>
- (void)didInputText:(NSString*)text;
@end

@interface PwdInput : UIView
@property(nonatomic,strong) UITextField* tfInvisible;
@property(nonatomic,assign) NSInteger columnCount;
@property(nonatomic,weak) id<PwdInputDelegate> inputDelegate;
@property(nonatomic,strong) NSMutableString* content;

- (instancetype) initWithFrame:(CGRect)frame andColumeCount:(NSInteger) columnCount;
@end
