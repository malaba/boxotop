//
//  Ratings.h
//  boxotop
//
//  Created by Pascal Drouilly on 02/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import <Mantle.h>

@interface Ratings : MTLModel <MTLJSONSerializing>

@property (readonly, copy, nonatomic) NSString *critics_rating;
@property (readonly, copy, nonatomic) NSNumber *critics_score;
@property (readonly, copy, nonatomic) NSString *audience_rating;
@property (readonly, copy, nonatomic) NSNumber *audience_score;

@end
