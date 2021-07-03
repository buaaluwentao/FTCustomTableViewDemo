//
//  FTTableviewCellHandler.m
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/7/3.
//

#import "FTTableviewCellHandler.h"
#import "FTTableviewCellHandler+Delegate.h"
#import "FTTableviewCellHandler+DataSource.h"
#import "FTTextCellModel.h"
#import "FTImageCellModel.h"
#import "FTTextTableViewCell.h"
#import "FTImageTableViewCell.h"
#import "FTCellModelProtocol.h"
#import "UITableView+ReuseIdentifier.h"
#import "FTTableViewCell.h"

@interface FTTableviewCellHandler()

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation FTTableviewCellHandler
@synthesize viewController;

- (NSArray<id<FTCellModelProtocol>> *)cellModels {
    if (!_cellModels) {
        _cellModels = [[NSMutableArray alloc] init];
        for (int i = 0; i < 100; i++) {
            int row = (arc4random() % 100);
            if (row % 2 == 0) {
                FTTextCellModel *model = [[FTTextCellModel alloc] init];
                model.text = [NSString stringWithFormat:@"第%@行", @(i+1)];
                [_cellModels addObject:model];
            } else {
                FTImageCellModel *model = [[FTImageCellModel alloc] init];
                model.image = [UIImage imageNamed:@"card"];
                [_cellModels addObject:model];
            }
        }
    }
    return _cellModels;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                    message:@"是否删除"
                                                             preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self.cellModels removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationLeft];
    }];
    
    [alert addAction:cancel];
    [viewController presentViewController:alert animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<FTCellModelProtocol> cellModel = self.cellModels[indexPath.row];
    id<FTTableViewCellProtocol> cell;
    if ([cellModel type] == FTCellModelTypesText) {
        cell = [tableView cellWithReuseIdentifier:FTTextTableViewCell.identifier];
    } else {
        cell = [tableView cellWithReuseIdentifier:FTImageTableViewCell.identifier];
    }
    
    [cell bindViewModel:cellModel];
    return (UITableViewCell *)cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.text = @"titleofheader";
    return label;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.text = @"我也是有底线的";
    return label;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.cellModels.count - 1 && !self.tableView) {
        self.tableView = tableView;
        [self performSelectorInBackground:@selector(loadMore) withObject:nil];
    }
}

- (void)loadMore {
    FTTextCellModel *model = [[FTTextCellModel alloc] init];
    model.text = @"最新数据1";
    FTTextCellModel *model2 = [[FTTextCellModel alloc] init];
    model2.text = @"最新数据2";
    NSArray *more = @[model, model2];
    [self performSelectorOnMainThread:@selector(appendDataToTableView:) withObject:more waitUntilDone:NO];
}
 
- (void)appendDataToTableView:(NSArray<id<FTCellModelProtocol>> *)data{
    for (int i=0; i<[data count]; i++) {
        [self.cellModels addObject:[data objectAtIndex:i]];
    }
    
    NSMutableArray *insertIndexPaths = [NSMutableArray arrayWithCapacity:[data count]];
    for (int ind = 0; ind < [data count]; ind++) {
        NSIndexPath *newPath =  [NSIndexPath indexPathForRow:[self.cellModels indexOfObject:[data objectAtIndex:ind]] inSection:0];
        
        [insertIndexPaths addObject:newPath];
    }
  
    [self.tableView insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationFade];
    self.tableView = nil;
}

@end
