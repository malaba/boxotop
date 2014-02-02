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
    self.dateFormatter.dateFormat = @"MMM d yyyy";
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
    
    self.criticsScoreImageView.image = [self imageFromScore:self.movie.ratings.critics_score];
    self.audienceScoreImageView.image = [self imageFromScore:self.movie.ratings.audience_score];
}

- (UIImage *)imageFromScore:(NSNumber *)score {
    NSUInteger integerScore = floor([score doubleValue]/20.0 + 0.5);
    
    switch (integerScore) {
        case 0:
            return nil;
            break;
            
        case 1:
            return [UIImage imageNamed:@"1starSmall"];
            break;

        case 2:
            return [UIImage imageNamed:@"2starSmall"];
            break;
            
        case 3:
            return [UIImage imageNamed:@"3starSmall"];
            break;
            
        case 4:
            return [UIImage imageNamed:@"4starSmall"];
            break;
            
        case 5:
            return [UIImage imageNamed:@"5starSmall"];
            break;
            
        default:
            return nil;
            break;
    }
}

@end
