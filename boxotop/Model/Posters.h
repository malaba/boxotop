//
//  Posters.h
//  boxotop
//
//  Created by Pascal Drouilly on 02/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import <Mantle.h>

@interface Posters : MTLModel <MTLJSONSerializing>

@property (readonly, copy, nonatomic) NSURL *thumbnail;
@property (readonly, copy, nonatomic) NSURL *profile;
@property (readonly, copy, nonatomic) NSURL *detailed;
@property (readonly, copy, nonatomic) NSURL *original;

@end
