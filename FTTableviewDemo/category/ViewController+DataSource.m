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

@implementation ViewController (DataSource)

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"section=%@,index=%@", @(indexPath.section), @(indexPath.row));
    id<FTCellModelProtocol> cellModel = self.cellModels[indexPath.row];
    UITableViewCell *cell;
    if ([cellModel type] == FTCellModelTypesText) {
        cell = [tableView cellWithReuseIdentifier:FTTextTableViewCell.identifier];
    } else {
        cell = [tableView cellWithReuseIdentifier:FTImageTableViewCell.identifier];
    }
    
    [((id<FTTableViewCellProtocol>)cell) bindViewModel:cellModel];
    NSLog(@"%p", cell);
    return cell;
}

@end
