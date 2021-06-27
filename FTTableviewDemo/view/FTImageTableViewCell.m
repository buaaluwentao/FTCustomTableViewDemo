//
//  FTImageTableViewCell.m
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/6/26.
//

#import "FTImageTableViewCell.h"
#import "FTImageCellModel.h"

@interface FTImageTableViewCell()

@property(nonatomic, strong) UIImageView *imgView;
@property(nonatomic, strong) FTImageCellModel *model;

@end

@implementation FTImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.imgView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imgView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imgView.frame = self.bounds;
}

- (void)bindViewModel:(FTImageCellModel *)viewModel {
    self.model = viewModel;
    _imgView.image = _model.image;
}

@end
