//
//  Cast.h
//  boxotop
//
//  Created by Pascal Drouilly on 02/02/14.
//  Copyright (c) 2014 drouilly. All rights reserved.
//

#import <Mantle.h>

@interface Cast : MTLModel <MTLJSONSerializing>

@property (readonly, copy, nonatomic) NSString *name;

@end
