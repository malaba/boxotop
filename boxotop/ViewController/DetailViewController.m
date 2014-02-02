//
//  DetailViewController.m
//  boxotop
//
//  Created by Pascal Drouilly on 01/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailViewController+Private.h"


@implementation DetailViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
}

#pragma mark - Setter & Getter
- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;

        // Update the view.
        [self configureView];
    }
}

#pragma mark - Utils
- (void)configureView {
    // Update the user interface for the detail item.

}

@end
