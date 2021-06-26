//
//  FTCellTextModel.h
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/6/26.
//

#import "FTCellModelProtocol.h"

#ifndef FTCellTextModel_h
#define FTCellTextModel_h

@protocol FTTextCellModelProtocol <FTCellModelProtocol>

@property(nonatomic, copy) NSString *text;

@end

#endif /* FTCellTextModel_h */
