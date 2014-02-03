//
//  DetailView.m
//  boxotop
//
//  Created by Pascal Drouilly on 03/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView

- (void)awakeFromNib {
    NSArray *views = @[self.synopsisTextView, self.castTextView, self.similarTextVew];
    
    for (UIView *view in views) {
        view.layer.borderColor = [[UIColor blackColor] CGColor];
        view.layer.borderWidth = 1.0f;
    }
}

@end
