//
//  UnequalHeightCell.h
//  UnequalHeightDemo
//
//  Created by kiwik on 7/9/15.
//  Copyright (c) 2015 Kiwik. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ManualModel;
@interface UnequalHeightCell : UITableViewCell

@property (nonatomic, strong)ManualModel *manual;

+(CGFloat)cellHeight:(ManualModel*)model;

@end
