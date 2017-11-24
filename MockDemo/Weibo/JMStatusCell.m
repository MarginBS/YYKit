//
//  JMStatusCell.m
//  YYKitDemo
//
//  Created by jama on 2017/11/24.
//  Copyright © 2017年 jama. All rights reserved.
//

#import "JMStatusCell.h"


@interface JMStatusCell ()

@property (nonatomic, strong) WBStatusView *statusView;

@end

@implementation JMStatusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _statusView = [WBStatusView new];
        _statusView.cell = self;
        _statusView.titleView.cell = self;
        _statusView.profileView.cell = self;
        _statusView.cardView.cell = self;
        _statusView.toolbarView.cell = self;
        _statusView.tagView.cell = self;
        [self.contentView addSubview:_statusView];
    }
    return self;
}

- (void)setLayout:(WBStatusLayout *)layout {
    self.height = layout.height;
    self.contentView.height = layout.height;
    _statusView.layout = layout;
}

@end
