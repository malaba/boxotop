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
#pragma mark - View Lifecycle
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.dateFormatter = [NSDateFormatter new];
    self.dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    self.dateFormatter.dateFormat = @"MMM dd yyyy";
}

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
    self.releaseDateLabel.text = [self.dateFormatter stringFromDate:self.movie.theaterReleaseDate];
}

@end
