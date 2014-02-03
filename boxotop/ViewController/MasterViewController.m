//
//  MasterViewController.m
//  boxotop
//
//  Created by Pascal Drouilly on 01/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import "MasterViewController.h"
#import "MasterViewController+Private.h"

#import "DetailViewController.h"
#import "Movie.h"
#import "Movie_Cell.h"

#import <AFNetworking.h>
#import <MBProgressHUD.h>
#import <UIImageView+AFNetworking.h>


@implementation MasterViewController

#pragma mark - View Lifecycle
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.model = [NSMutableArray new];
    self.searchResults = [NSMutableArray new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh:)];
    self.navigationItem.rightBarButtonItem = refreshButton;

    self.tableView.contentInset = UIEdgeInsetsMake(-44, 0, 0, 0);
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search:)];
    self.navigationItem.leftBarButtonItem = searchButton;
    
    [self fetchBoxOffice];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSArray *sourceArray;
        NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForCell:(UITableViewCell *)sender];
        if (indexPath != nil) {
            sourceArray = self.searchResults;
        }
        else {
            indexPath = [self.tableView indexPathForSelectedRow];
            sourceArray = self.model;
        }
        
        Movie *movie = sourceArray[indexPath.row];
        
        DetailViewController *destinationController = segue.destinationViewController;
        [destinationController setMovie:movie];
    }
}

#pragma mark - Utils
- (void)refresh:(id)sender {
    [self.model removeAllObjects];
    [self fetchBoxOffice];
}

- (void)fetchBoxOffice {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:@"http://xebiamobiletest.herokuapp.com/api/public/v1.0/lists/movies/box_office.json"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             
             if ([responseObject isKindOfClass:[NSDictionary class]]) {
                 [self parseResponse:responseObject];
             }
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             
             NSLog(@"Error: %@", error);
         }];
}
                                   
- (void)parseResponse:(NSDictionary *)json {
    NSArray *movies = json[@"movies"];
    
    NSError *error = nil;
    for (NSDictionary *movieDict in movies) {
        Movie *movie = [MTLJSONAdapter modelOfClass:Movie.class
                                 fromJSONDictionary:movieDict
                                              error:&error];
        if (error) {
            NSLog(@"error parsing one movie: %@", error);
        }
        
        [self.model addObject:movie];
    }
    
    [self.tableView reloadData];
}

- (void)search:(id)sender {
    [self.searchBar becomeFirstResponder];
}

- (void)updateFilteredContent:(NSString *)searchString {
    if ((searchString == nil) || [searchString length] == 0) {
        self.searchResults = [self.model mutableCopy];
        return;
    }
    
    [self.searchResults removeAllObjects]; // First clear the filtered array.
    
    for (Movie *movie in self.model) {
        NSRange foundRange = [movie.title rangeOfString:searchString
                                                options:NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch
                                                  range:NSMakeRange(0, movie.title.length)];
        if (foundRange.length > 0) {
            [self.searchResults addObject:movie];
        }
    }
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.searchResults count];
    }
    else {
        return [self.model count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Movie_Cell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Movie_Cell" forIndexPath:indexPath];
    
    Movie *movie;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        movie = self.searchResults[indexPath.row];
    }
    else {
        movie = self.model[indexPath.row];
    }
    
    cell.contentView.backgroundColor = indexPath.row%2 ? [UIColor whiteColor] : [UIColor colorWithRed:86.0/255 green:129.0/255 blue:103.0/255 alpha:1.0];
    
    cell.titleLabel.text = movie.title;
    cell.yearLabel.text = [NSString stringWithFormat:@"(%@)", [movie.year stringValue]];
    [cell.thumbnail setImageWithURL:movie.posters.profile];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

#pragma mark - UISearchDisplayController Delegate
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self updateFilteredContent:searchString];
     
    return TRUE;
}

@end
