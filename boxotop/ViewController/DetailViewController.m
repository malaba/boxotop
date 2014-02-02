//
//  DetailViewController.m
//  boxotop
//
//  Created by Pascal Drouilly on 01/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailViewController+Private.h"

#import "Movie.h"

#import <UIImageView+AFNetworking.h>


@implementation DetailViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
}

#pragma mark - Setter & Getter
- (void)setMovie:(Movie *)newMovie {
    if (_movie != newMovie) {
        _movie = newMovie;

        // Update the view.
        [self configureView];
    }
}

#pragma mark - Utils
- (void)configureView {
    self.titleLabel.text = self.movie.title;
    [self.thumbnailImageView setImageWithURL:self.movie.posters.detailed];
}

@end
