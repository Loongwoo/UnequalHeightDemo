//
//  UnequalHeightCell.m
//  UnequalHeightDemo
//
//  Created by kiwik on 7/9/15.
//  Copyright (c) 2015 Kiwik. All rights reserved.
//

#import "UnequalHeightCell.h"
#import "ManualModel.h"
#import "NSString+Extensions.h"

#define LeftRightMargin 10
#define TopBottomMargin 5
#define MinHeight 30
#define QFont [UIFont boldSystemFontOfSize:16]
#define AFont [UIFont systemFontOfSize:14]
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation UnequalHeightCell
{
    UIView *questionView, *answerView;
    UILabel *questionLabel,*answerLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        questionView=[[UIView alloc]initWithFrame:CGRectZero];
        questionView.backgroundColor=[UIColor colorWithRed:0 green:0.75 blue:1 alpha:1];
        [self addSubview:questionView];
        
        questionLabel=[self labelWithFont:QFont textColor:[UIColor whiteColor]];
        [questionView addSubview:questionLabel];
        
        answerView=[[UIView alloc]initWithFrame:CGRectZero];
        answerView.backgroundColor=[UIColor whiteColor];
        [self addSubview:answerView];
        
        answerLabel=[self labelWithFont:AFont textColor:[UIColor blackColor]];
        [answerView addSubview:answerLabel];
    }
    return self;
}

-(UILabel*)labelWithFont:(UIFont*)font textColor:(UIColor*)textColor{
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectZero];
    label.backgroundColor=[UIColor clearColor];
    label.textColor=textColor;
    label.font=font;
    label.numberOfLines=0;
    label.textAlignment=NSTextAlignmentLeft;
    return label;
}

-(void)setManual:(ManualModel *)manual{
    _manual=manual;
    
    questionLabel.text=[NSString stringWithFormat:@"Q%d: %@",(int)manual.ID,manual.question];
    answerLabel.text=manual.answer;
    
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    //设置问题的frame
    CGFloat height=[UnequalHeightCell height:_manual.question font:QFont];
    questionView.frame=CGRectMake(0, 0, ScreenWidth, height);
    questionLabel.frame=CGRectInset(questionView.bounds, LeftRightMargin, TopBottomMargin);
    
    //设置答案的frame
    height=[UnequalHeightCell height:_manual.answer font:AFont];
    answerView.frame=CGRectMake(0, questionView.frame.size.height, ScreenWidth, height);
    answerLabel.frame=CGRectInset(answerView.bounds, LeftRightMargin, TopBottomMargin);
}

//根据字体计算问题和答案View需要的高度
+(CGFloat)height:(NSString*)text font:(UIFont*)font{
    
    CGSize size=[text sizeWithFont:font constrainedToSize:CGSizeMake(ScreenWidth-2*LeftRightMargin, 2000) lineBreakMode:NSLineBreakByWordWrapping];
   return MAX(MinHeight, ceilf(size.height)+2*TopBottomMargin);
}

//Cell的总高度
+(CGFloat)cellHeight:(ManualModel*)model{
    
    return [UnequalHeightCell height:model.question font:QFont] + [UnequalHeightCell height:model.answer font:AFont];
}

@end
