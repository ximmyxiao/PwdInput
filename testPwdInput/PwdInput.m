//
//  PwdInput.m
//  testPwdInput
//
//  Created by Piao Piao on 15/3/3.
//  Copyright (c) 2015年 Piao Piao. All rights reserved.
//

#import "PwdInput.h"
@interface PwdInput() <UITextFieldDelegate>
@property(nonatomic,assign) CGFloat yInset;
@property(nonatomic,assign) CGFloat xInset;
@end

@implementation PwdInput

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype) initWithFrame:(CGRect)frame andColumeCount:(NSInteger) columnCount
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.yInset = 5;
        self.xInset = 5;

        self.columnCount = columnCount;
        self.content = [NSMutableString string];
        
        self.tfInvisible = [[UITextField alloc] initWithFrame:CGRectZero];
        self.tfInvisible.delegate = self;
        self.tfInvisible.keyboardType = UIKeyboardTypeNumberPad;
        [self addSubview:self.tfInvisible];
        
        [self.tfInvisible becomeFirstResponder];
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.cornerRadius = 5;
        self.layer.borderWidth = 1;
        self.layer.masksToBounds = YES;
    }
    
    return self;
}



- (void)drawRect:(CGRect)rect
{
    
    CGFloat columnWidth = self.frame.size.width;
    if (self.columnCount > 0)
    {
        columnWidth = self.frame.size.width/self.columnCount;

    }
    
    for (NSInteger i = 0 ; i < self.columnCount ; i++)
    {
        [[UIColor lightGrayColor] setFill];
        CGRect rect = CGRectMake(i* columnWidth, self.yInset, 0.5, self.frame.size.height - 2*self.yInset);
        UIRectFill(rect);
        if ([self.content length] >= i+1)
        {
            [[UIColor blackColor] setFill];
            UIBezierPath* bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(i* columnWidth+self.xInset, self.yInset, columnWidth - 2*self.xInset, self.frame.size.height - 2*self.yInset)];
            [bezierPath fill];

        }
    }
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSMutableString* oldString = [NSMutableString stringWithString:self.content];
    [self.content replaceCharactersInRange:range withString:string];
    if ([self.content length] > self.columnCount)
    {
        self.content = oldString;
        if ([self.inputDelegate respondsToSelector:@selector(didInputText:)])
        {
            [self.inputDelegate didInputText:self.content];
        }
        [self setNeedsDisplay];
        return NO;
    }
    else
    {
        if ([self.inputDelegate respondsToSelector:@selector(didInputText:)])
        {
            [self.inputDelegate didInputText:self.content];
        }
        [self setNeedsDisplay];
        return YES;
    }

}

@end
