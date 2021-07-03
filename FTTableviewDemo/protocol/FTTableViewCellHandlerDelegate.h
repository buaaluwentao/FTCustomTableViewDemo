//
//  FTTableViewCellHandlerDelegate.h
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/7/3.
//

#import <UIKit/UIKit.h>

#ifndef FTTableViewCellHandlerDelegate_h
#define FTTableViewCellHandlerDelegate_h

@protocol FTTableViewCellHandlerDelegate <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, weak) UIViewController *viewController;

@end

#endif /* FTTableViewCellHandlerDelegate_h */
