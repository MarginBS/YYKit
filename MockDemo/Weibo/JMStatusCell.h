//
//  JMStatusCell.h
//  YYKitDemo
//
//  Created by jama on 2017/11/24.
//  Copyright © 2017年 jama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBStatusCell.h"

@interface JMStatusCell : UITableViewCell

@property (nonatomic, weak) id<WBStatusCellDelegate> delegate;

- (void)setLayout:(WBStatusLayout *)layout;

@end
