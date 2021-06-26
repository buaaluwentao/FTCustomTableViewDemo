//
//  ViewController.m
//  FTTableviewDemo
//
//  Created by wentao lu on 2021/6/26.
//

#import "ViewController.h"
#import "FTCellModelProtocol.h"
#import "ViewController+Delegate.h"
#import "ViewController+DataSource.h"
#import "FTTextCellModel.h"
#import "FTImageCellModel.h"

@interface ViewController ()

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

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

@end
