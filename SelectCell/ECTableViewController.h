//
//  ECTableViewController.h
//  SelectCell
//
//  Created by Zuhe on 15/9/28.
//  Copyright © 2015年 Shawn. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MAIN_CELLS_HEIGHT 44
#define WINDOW_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define WINDOW_WIDTH [[UIScreen mainScreen] bounds].size.width

@protocol ECTableViewDataSource <NSObject>

- (UITableViewCell *)extensiveCellForRowIndexPath:(NSIndexPath *)indexPath;

- (UIView *)viewForContainerAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (CGFloat)heightForExtensiveCellAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (void)extendCellAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface ECTableViewController : UIViewController<ECTableViewDataSource>

@property (strong, nonatomic) UITableView *tableview;

@end
