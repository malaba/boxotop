//
//  Posters.m
//  boxotop
//
//  Created by Pascal Drouilly on 02/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import "Posters.h"

@implementation Posters

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
               @"thumbnailURL": @"thumbnail",
               @"profileURL": @"profile",
               @"detailedURL": @"detailed",
               @"originalURL": @"original"
    };
}

+ (NSValueTransformer *)thumbnailURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)profileURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)detailedURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)originalURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
