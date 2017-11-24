//
//  JMRootViewController.m
//  YYKitDemo
//
//  Created by jama on 2017/11/24.
//  Copyright © 2017年 jama. All rights reserved.
//

#import "JMRootViewController.h"

@interface JMRootViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation JMRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"YYKit Example Mocked by Jama";
    [self setupData];
    [self setupTableView];
}

- (void)setupData
{
    self.dataArray = @[].mutableCopy;
    NSDictionary *nameVcDic1 = @{
                                @"name":@"Model",
                                @"vc":@"YYModelExample"
                                };
    NSDictionary *nameVcDic2 = @{
                                 @"name":@"Image",
                                 @"vc":@"YYImageExample"
                                 };
    NSDictionary *nameVcDic3 = @{
                                 @"name":@"Text",
                                 @"vc":@"YYTextExample"
                                 };
    NSDictionary *nameVcDic4 = @{
                                 @"name":@"Feed List Demo",
                                 @"vc":@"JMFeedListExampleVc"
                                 };
    [self.dataArray addObject:nameVcDic1];
    [self.dataArray addObject:nameVcDic2];
    [self.dataArray addObject:nameVcDic3];
    [self.dataArray addObject:nameVcDic4];
}

- (void)setupTableView
{
    self.tableView.rowHeight = 60;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"jama"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:@"jama"];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *nameVcDic = self.dataArray[indexPath.row];
    cell.textLabel.text = nameVcDic[@"name"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *nameVcDic = self.dataArray[indexPath.row];
    Class class = NSClassFromString(nameVcDic[@"vc"]);
    UIViewController *vc = class.new;
    vc.title = nameVcDic[@"name"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
