//
//  ViewController.m
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/6/26.
//

#import "ViewController.h"
#import "FTCellModelProtocol.h"
#import "FTTableviewCellHandler+Delegate.h"
#import "FTTableviewCellHandler+DataSource.h"
#import "FTTextCellModel.h"
#import "FTImageCellModel.h"
#import "FTTableviewCellHandler.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) id<FTTableViewCellHandlerDelegate> tableViewHandler;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewHandler = [[FTTableviewCellHandler alloc] init];
    _tableViewHandler.viewController = self;
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    {
        _tableView.estimatedRowHeight = 50;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    };
    [self.view addSubview:_tableView];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return [_tableViewHandler tableView:tableView canEditRowAtIndexPath:indexPath];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [_tableViewHandler tableView:tableView editingStyleForRowAtIndexPath:indexPath];
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [_tableViewHandler tableView:tableView titleForDeleteConfirmationButtonForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableViewHandler tableView:tableView commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [_tableViewHandler tableView:tableView heightForRowAtIndexPath:indexPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_tableViewHandler tableView:tableView numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [_tableViewHandler tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [_tableViewHandler tableView:tableView viewForHeaderInSection:section];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableViewHandler tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [_tableViewHandler tableView:tableView viewForFooterInSection:section];
}

@end
