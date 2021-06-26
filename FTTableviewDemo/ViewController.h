//
//  ViewController.h
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/6/26.
//

#import <UIKit/UIKit.h>

@protocol FTCellModelProtocol;
@interface ViewController : UIViewController

@property(nonatomic, copy) NSMutableArray<id<FTCellModelProtocol>> *cellModels;

@end

