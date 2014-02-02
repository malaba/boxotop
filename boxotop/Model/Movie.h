//
//  Movie.h
//  boxotop
//
//  Created by Pascal Drouilly on 02/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import <Mantle.h>

#import "Posters.h"
#import "Ratings.h"


@interface Movie : MTLModel <MTLJSONSerializing>

@property (readonly, copy, nonatomic) NSString *movieID;
@property (readonly, copy, nonatomic) NSString *title;
@property (readonly, copy, nonatomic) NSNumber *year;
@property (readonly, copy, nonatomic) NSString *mpaa_rating;
@property (readonly, copy, nonatomic) NSNumber *runtime;
@property (readonly, copy, nonatomic) NSString *critics_consensus;
@property (readonly, copy, nonatomic) NSDate *theaterReleaseDate;
@property (readonly, copy, nonatomic) Ratings *ratings;
@property (readonly, copy, nonatomic) NSString *synopsis;
@property (readonly, copy, nonatomic) Posters *posters;

@end
