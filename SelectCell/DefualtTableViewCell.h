//
//  DefualtTableViewCell.h
//  SelectCell
//
//  Created by Zuhe on 15/9/29.
//  Copyright © 2015年 Shawn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DefualtTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Label;

+ (NSString *)reusableIdentifier;
+ (void)registerNibToTableView:(UITableView *)tableView;

- (void)addcontentView:(UIView *)contentView;

@end
