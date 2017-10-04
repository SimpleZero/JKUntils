//
//  JKUtilsExample.m
//  JKUtils_Example
//
//  Created by 01 on 2017/10/4.
//  Copyright © 2017年 SimpleZero. All rights reserved.
//

#import "JKUtilsExample.h"

@interface JKUtilsExample ()
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *clsNames;
@end

@implementation JKUtilsExample

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setup];
    
    [self _addCellTitle:@"FPS Example" clsName:@"JKFPSExample"];
    
    [self.tableView reloadData];
}

- (void)_setup {
    self.title = @"JKUtilsExample";
    self.titles = @[].mutableCopy;
    self.clsNames = @[].mutableCopy;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"JK"];
}

- (void)_addCellTitle:(NSString *)title clsName:(NSString *)clsName{
    [self.titles addObject:title];
    [self.clsNames addObject:clsName];
}

#pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JK"];
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Class cls = NSClassFromString(_clsNames[indexPath.row]);
    if (cls) {
        UIViewController *vc = [[cls alloc] init];
        vc.title = _titles[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
