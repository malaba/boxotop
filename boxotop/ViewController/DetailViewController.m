//
//  DetailViewController.m
//  boxotop
//
//  Created by Pascal Drouilly on 01/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailViewController+Private.h"

#import "DetailView.h"
#import "Movie.h"

#import <AFNetworking.h>
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
    
    // async load json for similar movies
    [self fetchSimilar:self.movie.similiarMoviesLink];
    
    // setup ScrollView/DetailView
    self.detailView = [[NSBundle mainBundle] loadNibNamed:@"DetailView" owner:self options:nil][0];
    [self.scrollView addSubview:self.detailView];
    self.scrollView.contentSize = CGSizeMake(self.detailView.frame.size.width, self.detailView.frame.size.height);
    
    [self configureView];
}

#pragma mark - Setter & Getter
- (void)setMovie:(Movie *)newMovie {
    if (_movie != newMovie) {
        _movie = newMovie;

        // Update the view
        [self configureView];
    }
}

#pragma mark - Utils
- (void)configureView {
    self.detailView.titleLabel.text = self.movie.title;
    self.detailView.borderView.layer.borderColor = [[UIColor blackColor] CGColor];
    self.detailView.borderView.layer.borderWidth = 1.0f;
    
    [self.detailView.thumbnailImageView setImageWithURL:self.movie.posters.detailed];
    self.detailView.releaseDateLabel.text = [self.dateFormatter stringFromDate:self.movie.theaterReleaseDate];
    
    self.detailView.criticsScoreImageView.image = [self imageFromScore:self.movie.ratings.critics_score];
    self.detailView.audienceScoreImageView.image = [self imageFromScore:self.movie.ratings.audience_score];
    
    self.detailView.synopsisTextView.text = self.movie.synopsis;
    self.detailView.castTextView.text = [self castsList];
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

- (NSString *)castsList {
    NSMutableString *casts = [NSMutableString new];
    
    for (Cast *cast in self.movie.abridged_cast) {
        [casts appendFormat:@", %@", cast.name];
    }
    
    if ([casts length] > 2) {
        [casts deleteCharactersInRange:NSMakeRange(0, 2)];
    }
    
    return casts;
}

#pragma mark - fetch JSON for similar movies
- (void)fetchSimilar:(NSString *)url {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // handle the case where the server return an HTML content-type instead of a JSON
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromSet:[NSSet setWithObject:@"text/html"]];
    
    [manager GET:url
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
    NSMutableString *similarMovies = [NSMutableString new];
    
    NSArray *movies = json[@"movies"];
    
    NSError *error = nil;
    for (NSDictionary *movieDict in movies) {
        Movie *movie = [MTLJSONAdapter modelOfClass:Movie.class
                                 fromJSONDictionary:movieDict
                                              error:&error];
        if (error) {
            NSLog(@"error parsing one movie: %@", error);
        }
        
        [similarMovies appendFormat:@", %@", movie.title];
    }
    
    if ([similarMovies length] > 2) {
        [similarMovies deleteCharactersInRange:NSMakeRange(0, 2)];
    }
    
    self.detailView.similarTextVew.text = similarMovies;
}

@end
