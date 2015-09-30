//
//  TableViewCell.m
//  SelectCell
//
//  Created by Zuhe on 15/9/28.
//  Copyright © 2015年 Shawn. All rights reserved.
//

#import "TableViewCell.h"
#define REUSABLE_IDENTIFIER @"TableViewCell"

@interface TableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *DefaultLabel;
@property (weak, nonatomic) UIView *viewToDisplay;

@end

@implementation TableViewCell

+ (void)registerNibToTableView:(UITableView *)tableView
{
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:[TableViewCell reusableIdentifier]];
}

+ (NSString *)reusableIdentifier
{
    return REUSABLE_IDENTIFIER;
}

- (void)addcontentView:(UIView *)contentView
{
    self.DefaultLabel.hidden = (contentView != nil);
    self.viewToDisplay = contentView;
    
}

- (void)setViewToDisplay:(UIView *)viewToDisplay
{
    [_viewToDisplay removeFromSuperview];
    _viewToDisplay = viewToDisplay;
    [self.contentView addSubview:_viewToDisplay];
}


@end
