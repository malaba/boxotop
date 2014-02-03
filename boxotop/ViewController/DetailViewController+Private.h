//
//  DetailViewController+Private.h
//  boxotop
//
//  Created by Pascal Drouilly on 02/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@property (strong, nonatomic) DetailView *detailView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (void)configureView;

@end
