//
//  AJKArmor.m
//  Pirate
//
//  Created by Alan Jaw on 7/7/14.
//  Copyright (c) 2014 AJK. All rights reserved.
//

#import "AJKArmor.h"

@implementation AJKArmor
- (instancetype)initWithArmorName: (NSString *)name

{
    self = [super init];
    
    if (self) {
        _name = name;
    }
    return self;
}

- (instancetype)initWithArmorName: (NSString *)name
                           health:(int)health
{
    self = [super init];
    
    if (self) {
        _name = name;
        _health = health;
    }
    return self;
}
@end
