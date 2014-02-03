//
//  MasterViewController+Private.h
//  boxotop
//
//  Created by Pascal Drouilly on 02/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController ()

@property (strong, nonatomic) NSMutableArray *model;
@property (strong, nonatomic) NSMutableArray *searchResults;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
