//
//  ViewController.m
//  SelectCell
//
//  Created by Zuhe on 15/9/28.
//  Copyright © 2015年 Shawn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate>

@end

@implementation ViewController


- (UITableViewCell *)extensiveCellForRowIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"DefualtTableViewCell";
    UITableViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

- (CGFloat)heightForExtensiveCellAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (NSInteger)numberOfSections {
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 16;
}

- (UIView *)viewForContainerAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 1: {
            // Will instantiate the DatePickerView on every opening/closing
            UIDatePicker *datePicker = [[UIDatePicker alloc] init];
            UIView *dropDownView = datePicker;
            
            return dropDownView;
        }
            
        case 2: {
            // Will instantiate the MapView once. Best way for better performances.
            
            return nil;
        }
            
        case 3: {
            // Will instantiate the View on every opening/closing
            // The frame origin set to (10, 10) will create a margin-top and margin-left effect of 10 pixels.
            // Width 300 will do the rest (the full width of the screen is 320 = 300 + 10 + 10).
            UIView *dropDownView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 88)];
            dropDownView.backgroundColor = [UIColor redColor];
            
            return dropDownView;
        }
            
        case 4: {
            // Will instantiate the View on every opening/closing
            UIView *dropDownView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 88)];
            dropDownView.backgroundColor = [UIColor blueColor];
            
            return dropDownView;
        }
            
        case 5: {
            UIView *dropDownView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, self.tableview.bounds.size.height - ( 2 * [self heightForExtensiveCellAtIndexPath:indexPath]))];
            dropDownView.backgroundColor = [UIColor yellowColor];
            
            return dropDownView;
        }
            
        default:
            return nil;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self extendCellAtIndexPath:indexPath];
}

@end
