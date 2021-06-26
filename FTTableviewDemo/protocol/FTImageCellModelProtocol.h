//
//  FTImageModelProtocol.h
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/6/26.
//

#import "FTCellModelProtocol.h"
#import <UIKit/UIKit.h>

#ifndef FTImageModelProtocol_h
#define FTImageModelProtocol_h

@protocol FTImageCellModelProtocol <FTCellModelProtocol>

@property(nonatomic, strong) UIImage *image;

@end

#endif /* FTImageModelProtocol_h */
