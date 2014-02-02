//
//  Posters.m
//  boxotop
//
//  Created by Pascal Drouilly on 02/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import "Posters.h"

@implementation Posters

#pragma mark - MTLJSONSerializing Protocol
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    // Note: all properties are implicitly mapped
    return @{};
}

+ (NSValueTransformer *)thumbnailJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)profileJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)detailedJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)originalJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
