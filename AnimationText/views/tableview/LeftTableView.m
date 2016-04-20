//
//  LeftTableView.m
//  AnimationText
//
//  Created by 李阳 on 16/4/19.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "LeftTableView.h"

#import "LeftCell.h"

@implementation LeftTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        [self registerNib:[UINib nibWithNibName:@"LeftCell" bundle:[NSBundle bundleForClass:[LeftCell class]]] forCellReuseIdentifier:@"Cell"];
        self.rowHeight = 35.0;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

#pragma mark --datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[LeftCell alloc] init];
    }
    NSString *imgname = [_dataArr[indexPath.row] objectForKey:@"imgname"];
    cell.leftImageView.image = [UIImage imageNamed:imgname];
    NSString *title = [_dataArr[indexPath.row] objectForKey:@"title"];
    cell.titleLabel.text = title;
    return cell;
}

#pragma mark --delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_leftRowSelect) {
        _leftRowSelect(indexPath);
    }
}

@end
