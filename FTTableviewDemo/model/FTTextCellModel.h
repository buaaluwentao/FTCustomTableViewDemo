//
//  FTCellTextModel.h
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/6/26.
//

#import <Foundation/Foundation.h>
#import "FTTextCellModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTTextCellModel : NSObject<FTTextCellModelProtocol>

@property(nonatomic, copy) NSString *text;

@end

NS_ASSUME_NONNULL_END
