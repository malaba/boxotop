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


@implementation MasterViewController

#pragma mark - View Lifecycle
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.model = [NSMutableArray new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchBoxOffice];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.model[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Utils
- (void)fetchBoxOffice {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:@"http://xebiamobiletest.herokuapp.com/api/public/v1.0/lists/movies/box_office.json"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             if ([responseObject isKindOfClass:[NSDictionary class]]) {
                 [self parseResponse:responseObject];
             }
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
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

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Movie_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Movie_Cell" forIndexPath:indexPath];
    
    Movie *movie = self.model[indexPath.row];
    
    cell.titleLabel.text = movie.title;
    cell.yearLabel.text = [movie.year stringValue];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
