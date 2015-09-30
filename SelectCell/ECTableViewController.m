//
//  ECTableViewController.m
//  SelectCell
//
//  Created by Zuhe on 15/9/28.
//  Copyright © 2015年 Shawn. All rights reserved.
//

#import "ECTableViewController.h"
#import "TableViewCell.h"
#import "DefualtTableViewCell.h"

@interface ECTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)NSIndexPath *selectedRowIndexPath;

@end

@implementation ECTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, WINDOW_WIDTH, WINDOW_HEIGHT-50)];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    
    [TableViewCell registerNibToTableView:self.tableview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark Selection mecanism

- (void)setSelectedRowIndexPath:(NSIndexPath *)selectedRowIndexPath
{
    _selectedRowIndexPath = selectedRowIndexPath;
}

- (BOOL)isSelectedRowIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath && self.selectedRowIndexPath) {
        if (indexPath.row == self.selectedRowIndexPath.row && indexPath.section == self.selectedRowIndexPath.section) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isExtendedCellIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath && self.selectedRowIndexPath) {
        if (indexPath.row == self.selectedRowIndexPath.row && indexPath.section == self.selectedRowIndexPath.section) {
            return YES;
        }
    }
    return NO;
}

- (void)extendCellAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath) {
        [self.tableview beginUpdates];
        
        if (self.selectedRowIndexPath) {
            if ([self isSelectedRowIndexPath:indexPath]) {
                NSIndexPath *tempIndexPath = self.selectedRowIndexPath;
                self.selectedRowIndexPath = nil;
                [self removeCellBelowIndexPath:tempIndexPath];
            }
            else if ([self isExtendedCellIndexPath:indexPath]);
            else
            {
                NSIndexPath *tempIndexPath = self.selectedRowIndexPath;
                if (indexPath.row > self.selectedRowIndexPath.row && indexPath.section == self.selectedRowIndexPath.section) {
                    indexPath = [NSIndexPath indexPathForRow:(indexPath.row - 1) inSection:indexPath.section];
                }
                self.selectedRowIndexPath = indexPath;
                [self removeCellBelowIndexPath:tempIndexPath];
                [self insertCellBelowIndexPath:indexPath];
            }
        } else {
            self.selectedRowIndexPath = indexPath;
            [self insertCellBelowIndexPath:indexPath];
        }
        
        [self.tableview endUpdates];
        [self.tableview scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

- (void)insertCellBelowIndexPath:(NSIndexPath *)indexPath
{
    indexPath = [NSIndexPath indexPathForRow:(indexPath.row + 1) inSection:indexPath.section];
    NSArray *pathsArray = @[indexPath];
    [self.tableview insertRowsAtIndexPaths:pathsArray withRowAnimation:UITableViewRowAnimationTop];
}

- (void)removeCellBelowIndexPath:(NSIndexPath *)indexPath
{
    indexPath = [NSIndexPath indexPathForRow:(indexPath.row + 1) inSection:indexPath.section];
    NSArray *pathsArray = @[indexPath];
    [self.tableview deleteRowsAtIndexPaths:pathsArray withRowAnimation:UITableViewRowAnimationTop];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.selectedRowIndexPath && self.selectedRowIndexPath.section == section) {
        return [self numberOfRowsInSection:section] + 1;
    }
    return [self numberOfRowsInSection:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self numberOfSections];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIView *contentView = [self viewForContainerAtIndexPath:indexPath];
    if ([self isExtendedCellIndexPath:indexPath] && contentView) {
        return 2 * contentView.frame.origin.y + contentView.frame.size.height;
    } else {
        return [self heightForExtensiveCellAtIndexPath:indexPath];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self isExtendedCellIndexPath:indexPath]) {
        NSString *identifier = [TableViewCell reusableIdentifier];
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        [cell addcontentView:[self viewForContainerAtIndexPath:indexPath]];
        return cell;
    }
    else
    {
        
        UITableViewCell *cell = nil;
        if (self.selectedRowIndexPath) {
            if ((indexPath.section >= self.selectedRowIndexPath.section) && (indexPath.row > self.selectedRowIndexPath.row)) {
                NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:(indexPath.row - 1) inSection:indexPath.section];
                
//                if (cell == nil) {
//                    cell = (DefualtTableViewCell *)[[[NSBundle mainBundle]loadNibNamed:Defualtidentifier owner:self options:nil]objectAtIndex:0];
//                }

                
                cell = [self extensiveCellForRowIndexPath:tmpIndexPath];
            }
            else
            {
                
//                if (cell == nil) {
//                    cell = (DefualtTableViewCell *)[[[NSBundle mainBundle]loadNibNamed:Defualtidentifier owner:self options:nil]objectAtIndex:0];
//                }
                cell = [self extensiveCellForRowIndexPath:indexPath];
            }
        }
        else
        {
    
//            if (cell == nil) {
//                cell = (DefualtTableViewCell *)[[[NSBundle mainBundle]loadNibNamed:Defualtidentifier owner:self options:nil]objectAtIndex:0];
//            }
            cell = [self extensiveCellForRowIndexPath:indexPath];
        }
        return cell;
    }
}

#pragma mark ECTableViewDataSource default

- (UITableViewCell *)extensiveCellForRowIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (CGFloat)heightForExtensiveCellAtIndexPath:(NSIndexPath *)indexPath
{
    return MAIN_CELLS_HEIGHT;
}

- (NSInteger)numberOfSections
{
    return 0;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UIView *)viewForContainerAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
