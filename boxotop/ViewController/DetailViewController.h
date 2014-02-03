//
//  DetailViewController.h
//  boxotop
//
//  Created by Pascal Drouilly on 01/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailView, Movie;


@interface DetailViewController : UIViewController

@property (strong, nonatomic) Movie *movie;
@property (strong, nonatomic) DetailView *detailView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
