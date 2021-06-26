//
//  FTTableViewCell.m
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/6/26.
//

#import "FTTableViewCell.h"

@implementation FTTableViewCell

+ (NSString *)identifier {
    return NSStringFromClass(self.class);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
