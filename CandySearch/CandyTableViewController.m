//
//  CandyTableViewController.m
//  CandySearch
//
//  Created by optimusmac4 on 9/10/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import "CandyTableViewController.h"
#import "Candy.h"
#import "CandyDetailViewController.h"


@interface CandyTableViewController ()

@end

@implementation CandyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect newBounds = self.tableView.bounds;
    newBounds.origin.y = newBounds.origin.y + _candySearchBar.bounds.size.height;
    self.tableView.bounds = newBounds;
    
    _candyArray = [NSArray arrayWithObjects:
                   [Candy candyOfType:@"1.jpg" category:@"Hard" name:@"Perk"],
                   [Candy candyOfType:@"2.jpg" category:@"Chocolate" name:@"5star"],
                   [Candy candyOfType:@"3.jpg" category:@"Chocolate" name:@"Bournville"],
                   [Candy candyOfType:@"4.jpg" category:@"Chocolate" name:@"Silk"],
                   [Candy candyOfType:@"5.jpg" category:@"Others" name:@"Milkybar"],
                   [Candy candyOfType:@"6.jpg" category:@"Others" name:@"Kismi bar"],
                   [Candy candyOfType:@"7.jpg" category:@"Chocolate" name:@"Fruit and Nut"],
                   [Candy candyOfType:@"8.jpg" category:@"Chocolate" name:@"Crackles"],
                   [Candy candyOfType:@"9.jpg" category:@"Others" name:@"Tomblerone"],
                   [Candy candyOfType:@"10.jpg" category:@"Hard" name:@"Ferro Rocher"],
                   [Candy candyOfType:@"5.jpg" category:@"Hard" name:@"Munch"],
                   [Candy candyOfType:@"4.jpg" category:@"Chocolate" name:@"Snickers"],
                   [Candy candyOfType:@"2.jpg" category:@"Chocolate" name:@"Dove Aus"],
                   [Candy candyOfType:@"3.jpg" category:@"Chocolate" name:@"Temptations"],
                   [Candy candyOfType:@"1.jpg" category:@"Others" name:@"Alpino"],
                   [Candy candyOfType:@"10.jpg" category:@"Others" name:@"Dairy Milk"],
                   [Candy candyOfType:@"9.jpg" category:@"Chocolate" name:@"Almond Roast"],
                   [Candy candyOfType:@"7.jpg" category:@"Chocolate" name:@"Amul Milk"],
                   [Candy candyOfType:@"6.jpg" category:@"Others" name:@"Kitkat"],
                   [Candy candyOfType:@"8.jpg" category:@"Hard" name:@"Nut & Fruits"],
                   nil
                   ];
    
    _filteredCandyArray = [NSMutableArray arrayWithCapacity:_candyArray.count];
    [[self tableView] reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Check to see whether the normal table or search results table is being displayed and return the count from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [_filteredCandyArray count];
    }
    else
    {
        return [_candyArray count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    Candy *candy = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        candy = [_filteredCandyArray objectAtIndex:indexPath.row];
    } else {
        candy = [_candyArray objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = candy.name;
  /*  cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.imageView.image = [UIImage imageNamed:candy.imageName];*/
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    // Configure the cell...
    return cell;
}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    
    [_filteredCandyArray removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
    NSArray *tempArray = [_candyArray filteredArrayUsingPredicate:predicate];
    
    if(![scope isEqualToString:@"All"]){
        NSPredicate *scopePredicate = [NSPredicate predicateWithFormat:@"SELF.category contains[c] %@",scope];
        tempArray = [tempArray filteredArrayUsingPredicate:scopePredicate];
        
    }
    _filteredCandyArray = [NSMutableArray arrayWithArray:tempArray];
}

#pragma mark - UISearchDisplayController Delegate Methods

//whenever the user changes the search string
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}
//changes in the Scope Bar input
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    
    return YES;
}


#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Perform segue to candy detail
    [self performSegueWithIdentifier:@"detailView" sender:tableView];
}

#pragma mark - Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"detailView"]) {
  //      UIViewController *candyDetailViewController = [segue destinationViewController];
        CandyDetailViewController *candyDetailViewController = [segue destinationViewController];
        // In order to manipulate the destination view controller, another check on which table (search or normal) is displayed is needed
        if(sender == self.searchDisplayController.searchResultsTableView) {
            NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            NSString *destinationTitle = [[_filteredCandyArray objectAtIndex:[indexPath row]] name];
            [candyDetailViewController setTitle:destinationTitle];
            candyDetailViewController.actualName = destinationTitle;
            candyDetailViewController.imageName =[[_filteredCandyArray objectAtIndex:[indexPath row]] imageName];
        }
        else {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            NSString *destinationTitle = [[_candyArray objectAtIndex:[indexPath row]] name];
            [candyDetailViewController setTitle:destinationTitle];
            candyDetailViewController.actualName = destinationTitle;
            candyDetailViewController.imageName =[[_candyArray objectAtIndex:[indexPath row]] imageName];
        }
        
    }
}

-(IBAction)goToSearch:(id)sender {
    
    [_candySearchBar becomeFirstResponder];
    
}

@end
