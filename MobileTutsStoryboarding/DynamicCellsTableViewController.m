//
//  DynamicCellsTableViewController.m
//  MobileTutsStoryboarding
//
//  Created by Collin Ruffenach on 10/30/11.
//

#import "DynamicCellsTableViewController.h"


@implementation DynamicCellsTableViewController

- (id)initWithStyle:(UITableViewStyle)style {

    self = [super initWithStyle:style];
    
    if (self) {
    
    }
    
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return (10 - section);
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [NSString stringWithFormat:@"Section %d", section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"dyncamicCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
    
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                       reuseIdentifier:CellIdentifier] autorelease];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"Section: %d Row: %d Sum: %d Product: %d", indexPath.section, indexPath.row, (indexPath.section+indexPath.row), (indexPath.section*indexPath.row)];
    
    return cell;
}

@end
