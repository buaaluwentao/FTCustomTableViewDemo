//
//  UITableView+ReuseIdentifier.m
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/6/26.
//

#import "UITableView+ReuseIdentifier.h"

@implementation UITableView (ReuseIdentifier)

- (__kindof UITableViewCell *)cellWithReuseIdentifier:(NSString *)identifier {
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        [self registerClass:NSClassFromString(identifier) forCellReuseIdentifier:identifier];
        cell = [self dequeueReusableCellWithIdentifier:identifier];
    }
    return cell;
}

@end
