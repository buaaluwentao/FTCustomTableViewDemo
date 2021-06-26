//
//  UITableView+ReuseIdentifier.h
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/6/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (ReuseIdentifier)

- (UITableViewCell *)cellWithReuseIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
