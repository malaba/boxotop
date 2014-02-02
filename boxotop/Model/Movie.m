//
//  Movie.m
//  boxotop
//
//  Created by Pascal Drouilly on 02/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import "Movie.h"


@implementation Movie

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    // Note: almost all properties are implicitly mapped
    return @{
             @"movieID": @"id"
    };
}

+ (NSValueTransformer *)postersJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:Posters.class];
}

@end
