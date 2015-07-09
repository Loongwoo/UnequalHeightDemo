//
//  ViewController.m
//  UnequalHeightDemo
//
//  Created by kiwik on 7/9/15.
//  Copyright (c) 2015 Kiwik. All rights reserved.
//

#import "ViewController.h"
#import "ManualModel.h"
#import <MJExtension.h>
#import "UnequalHeightCell.h"

@interface ViewController ()

@property (nonatomic, strong)NSArray *questionAndAnswerArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"用户手册";
    self.view.backgroundColor=[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma UITableViewDelegate & UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.questionAndAnswerArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ManualModel *model=self.questionAndAnswerArr[indexPath.row];
    return [UnequalHeightCell cellHeight:model];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identity=@"mycell";
    UnequalHeightCell *cell=[tableView dequeueReusableCellWithIdentifier:identity];
    if (cell==nil) {
        cell=[[UnequalHeightCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    cell.manual=self.questionAndAnswerArr[indexPath.row];
    return cell;
}
#pragma UITableViewDelegate & UITableViewDataSource

-(NSArray *)questionAndAnswerArr{
    
    if(_questionAndAnswerArr==nil){
        
        NSString *path=[[NSBundle mainBundle] pathForResource:@"questions" ofType:@"json"];
        NSData *data=[NSData dataWithContentsOfFile:path];
        NSArray *tmp=[data JSONObject];
        
        _questionAndAnswerArr=[ManualModel objectArrayWithKeyValuesArray:tmp];
    }
    return _questionAndAnswerArr;
}
@end
