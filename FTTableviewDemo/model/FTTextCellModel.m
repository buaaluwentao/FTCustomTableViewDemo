//
//  FTCellTextModel.m
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/6/26.
//

#import "FTTextCellModel.h"

@implementation FTTextCellModel

- (NSString *)identifier {
    return NSStringFromClass(self.class);
}

- (FTCellModelTypes)type {
    return FTCellModelTypesText;
}

@end
