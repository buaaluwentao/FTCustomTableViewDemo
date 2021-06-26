//
//  FTCellTableViewProtocol.h
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/6/26.
//

#import "FTCellModelProtocol.h"

#ifndef FTCellTableViewProtocol_h
#define FTCellTableViewProtocol_h

@protocol FTTableViewCellProtocol <NSObject>

+ (NSString *)identifier;
- (void)bindViewModel:(id<FTCellModelProtocol>)viewModel;

@end

#endif /* FTCellTableViewProtocol_h */
