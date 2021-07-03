//
//  FTTableviewCellHandler.h
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/7/3.
//

#import <Foundation/Foundation.h>
#import "FTTableViewCellHandlerDelegate.h"

NS_ASSUME_NONNULL_BEGIN
@protocol FTCellModelProtocol;
@interface FTTableviewCellHandler : NSObject<FTTableViewCellHandlerDelegate>

@property(nonatomic, copy) NSMutableArray<id<FTCellModelProtocol>> *cellModels;

@end

NS_ASSUME_NONNULL_END
