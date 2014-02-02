//
//  DetailViewController.h
//  boxotop
//
//  Created by Pascal Drouilly on 01/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie;


@interface DetailViewController : UIViewController

@property (strong, nonatomic) Movie *movie;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *criticsScoreImageView;
@property (weak, nonatomic) IBOutlet UIImageView *audienceScoreImageView;

@end
