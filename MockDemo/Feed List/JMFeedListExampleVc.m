//
//  JMFeedListExampleVc.m
//  YYKitDemo
//
//  Created by jama on 2017/11/24.
//  Copyright © 2017年 jama. All rights reserved.
//

#import "JMFeedListExampleVc.h"


@interface JMFeedListExampleVc ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation JMFeedListExampleVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupTableView];
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Data

- (void)setupData
{
    self.dataArray = @[].mutableCopy;
    NSDictionary *nameIconVcDicWeibo = @{
                                    @"name":@"Twitter",
                                    @"icon":@"Twitter.jpg",
                                    @"vc":@"T1HomeTimelineItemsViewController"
                                    };
    NSDictionary *nameIconVcDicTwitter = @{
                                         @"name":@"Weibo",
                                         @"icon":@"Weibo.jpg",
                                         @"vc":@"JMWeiboExampleViewController"
                                         };
    [self.dataArray addObject:nameIconVcDicWeibo];
    [self.dataArray addObject:nameIconVcDicTwitter];
}

- (void)setupTableView
{
    self.tableView.rowHeight = 60;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"list"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"list" forIndexPath:indexPath];
    NSDictionary *dic = _dataArray[indexPath.row];
    cell.textLabel.text = dic[@"name"];
    cell.imageView.image = [UIImage imageNamed:dic[@"icon"]];    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = _dataArray[indexPath.row];
    Class class = NSClassFromString(dic[@"vc"]);
    UIViewController *vc = class.new;
    vc.title = dic[@"name"];
    [self.navigationController pushViewController:vc animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
