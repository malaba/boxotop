//
//  Movie.m
//  boxotop
//
//  Created by Pascal Drouilly on 02/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import "Movie.h"


@implementation Movie

#pragma mark - Utils
+ (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *_dateFormatter;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        _dateFormatter.dateFormat = @"yyyy-MM-dd";
        
    });
    
    return _dateFormatter;
}

#pragma mark - MTLJSONSerializing Protocol
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    // Note: almost all properties are implicitly mapped
    return @{
             @"movieID": @"id",
             @"theaterReleaseDate": @"release_dates.theater"
    };
}

+ (NSValueTransformer *)postersJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:Posters.class];
}

+ (NSValueTransformer *)ratingsJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:Ratings.class];
}

+ (NSValueTransformer *)theaterReleaseDateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [self.dateFormatter dateFromString:str];
    } reverseBlock:^(NSDate *date) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

@end
