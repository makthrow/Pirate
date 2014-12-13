//
//  AJKWeapon.m
//  Pirate
//
//  Created by Alan Jaw on 7/7/14.
//  Copyright (c) 2014 AJK. All rights reserved.
//

#import "AJKWeapon.h"

@implementation AJKWeapon
- (instancetype)initWithWeaponName: (NSString *)name
                            damage:(int)damage
{
    // call the superclass's designated initializer
    self = [super init];
    
    // did the superclass's designated initializer succeed?
    if (self) {
        // give the instance variables initial values
        _name = name;
        _damage = damage;
    }
    // return the address of the newly initialized object
    return self;
}
@end
