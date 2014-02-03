//
//  DetailView.h
//  boxotop
//
//  Created by Pascal Drouilly on 03/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailView : UIView

@property (weak, nonatomic) IBOutlet UIView *borderView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *criticsScoreImageView;
@property (weak, nonatomic) IBOutlet UIImageView *audienceScoreImageView;

@property (weak, nonatomic) IBOutlet UITextView *synopsisTextView;
@property (weak, nonatomic) IBOutlet UITextView *castTextView;
@property (weak, nonatomic) IBOutlet UITextView *similarTextVew;

@end
