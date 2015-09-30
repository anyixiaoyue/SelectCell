//
//  TableViewCell.h
//  SelectCell
//
//  Created by Zuhe on 15/9/28.
//  Copyright © 2015年 Shawn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

+ (NSString *)reusableIdentifier;
+ (void)registerNibToTableView:(UITableView *)tableView;

- (void)addcontentView:(UIView *)contentView;

@end
