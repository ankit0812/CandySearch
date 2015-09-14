//
//  CandyTableViewController.h
//  CandySearch
//
//  Created by optimusmac4 on 9/10/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CandyTableViewController : UITableViewController <UISearchBarDelegate , UISearchDisplayDelegate>

@property (nonatomic, strong) NSArray *candyArray;

@property (nonatomic, strong) NSMutableArray *filteredCandyArray;
@property IBOutlet UISearchBar *candySearchBar;

-(IBAction)goToSearch:(id)sender;
@end
