//
//  FTCellImageModelProtocol.h
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/6/26.
//

#import <Foundation/Foundation.h>
#import "FTImageCellModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTImageCellModel : NSObject<FTImageCellModelProtocol>

@property(nonatomic, strong) UIImage *image;

@end

NS_ASSUME_NONNULL_END
