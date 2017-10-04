//
//  JKFPSExample.m
//  JKUtils_Example
//
//  Created by 01 on 2017/10/4.
//  Copyright © 2017年 SimpleZero. All rights reserved.
//

#import "JKFPSExample.h"
#import "JKFPSLabel.h"

@interface JKFPSExample ()<UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) JKFPSLabel *fps;
@end

@implementation JKFPSExample

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    self.fps = [[JKFPSLabel alloc] initWithFrame:CGRectMake(0, 80, 80, 30)];
    CGPoint center = self.fps.center;
    center.x = self.view.center.x;
    self.fps.center = center;
    [self.view addSubview:self.fps];
    
    CGFloat y = CGRectGetMaxY(self.fps.frame);
    CGRect frame = CGRectMake(0, y, self.view.bounds.size.width, self.view.bounds.size.height - y);
    self.tableView = [[UITableView alloc] initWithFrame:frame];
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"JK"];
    [self.view addSubview:self.tableView];
    
    self.data = @[].mutableCopy;
    for (int i = 0; i < 500; i++) {
        NSString *str = [NSString stringWithFormat:@"%zd    usleep(20000)", i];
        [self.data addObject:str];
    }
    
    [self.tableView reloadData];
}

- (NSAttributedString *)_create {
    UIImage *jk = [UIImage imageNamed:@"JK"];
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = jk;
    attachment.bounds = CGRectMake(0, 0, 20, 20);
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString attributedStringWithAttachment:attachment] mutableCopy];
    NSMutableAttributedString *other = [[NSMutableAttributedString alloc] initWithString:@"Just for JKFPSExample" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    [other addAttribute:NSForegroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(@"Just ".length, @"for ".length)];
    [other addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(@"Just for ".length, @"JKFPSExample".length)];
    [attrStr appendAttributedString:other];
    
    return attrStr;
}

#pragma mark - table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JK"];
    cell.textLabel.text = _data[indexPath.row];
    usleep(20000);
    return cell;
}

@end
