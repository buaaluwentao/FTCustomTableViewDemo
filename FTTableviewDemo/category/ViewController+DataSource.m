//
//  ViewController+DataSource.m
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/6/26.
//

#import "ViewController+DataSource.h"
#import "FTTextTableViewCell.h"
#import "FTImageTableViewCell.h"
#import "FTCellModelProtocol.h"
#import "UITableView+ReuseIdentifier.h"
#import "FTTableViewCell.h"

@implementation ViewController (DataSource)

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

@end
