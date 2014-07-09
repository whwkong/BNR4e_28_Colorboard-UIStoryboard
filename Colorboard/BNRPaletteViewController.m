//
//  BNRPaletteViewController.m
//  Colorboard
//
//  Created by William Kong on 2014-07-08.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import "BNRPaletteViewController.h"
#import "BNRColorViewController.h"
#import "BNRColorDescription.h"

@interface BNRPaletteViewController()

@property (nonatomic, strong) NSMutableArray *colors;

@end

@implementation BNRPaletteViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Accessors
- (NSMutableArray *)colors
{
    if (!_colors) {
        _colors = [NSMutableArray array];
        
        BNRColorDescription *cd = [[BNRColorDescription alloc] init];
        [_colors addObject:cd];
    }
    return _colors;
}


#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"NewColor"]) {
        
        // if adding a new color, create an instance and
        // add it to colors array
        BNRColorDescription *color = [[BNRColorDescription alloc] init];
        [self.colors addObject:color];
        
        // use the segue to set the color to the view controller
        UINavigationController *nc = (UINavigationController *)segue.destinationViewController;
        BNRColorViewController *cvc = (BNRColorViewController *)[nc topViewController];
        cvc.colorDescription = color;
        cvc.existingColor = NO;
    }
    else if ([segue.identifier isEqualToString:@"ExistingColor"]) {
        
        // For the push segue, the sender is the UITableViewCell
        NSIndexPath *ip = [self.tableView indexPathForCell:sender];
        BNRColorDescription *color = self.colors[ip.row];
        
        // Set the color, and also tell the view controller that this is an existing color
        BNRColorViewController *cvc = (BNRColorViewController *)segue.destinationViewController;
        cvc.colorDescription = color;
        cvc.existingColor = YES;
    }
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView
             numberOfRowsInSection:(NSInteger)section
{
    return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    
    BNRColorDescription *color = self.colors[indexPath.row];
    cell.textLabel.text = color.name;
    
    return cell;
}

@end
