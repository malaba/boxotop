//
//  Posters.h
//  boxotop
//
//  Created by Pascal Drouilly on 02/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import <Mantle.h>

@interface Posters : MTLModel <MTLJSONSerializing>

@property (readonly, copy, nonatomic) NSURL *thumbnailURL;
@property (readonly, copy, nonatomic) NSURL *profileURL;
@property (readonly, copy, nonatomic) NSURL *detailedURL;
@property (readonly, copy, nonatomic) NSURL *originalURL;

@end
