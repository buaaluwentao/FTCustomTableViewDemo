//
//  FTTextTableViewCell.m
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/6/26.
//

#import "FTTextTableViewCell.h"
#import "FTTextCellModel.h"

@interface FTTextTableViewCell()

@property(nonatomic, strong) UILabel *label;
@property(nonatomic, strong) FTTextCellModel *model;

@end

@implementation FTTextTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.label = [[UILabel alloc] init];
        [self.contentView addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _label.frame = self.bounds;
}

- (void)bindViewModel:(FTTextCellModel *)viewModel {
    self.model = viewModel;
    _label.text = _model.text;
}

@end
