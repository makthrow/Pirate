//
//  AJKCharacter.m
//  Pirate
//
//  Created by Alan Jaw on 7/7/14.
//  Copyright (c) 2014 AJK. All rights reserved.
//

#import "AJKCharacter.h"

@implementation AJKCharacter


- (instancetype)initWithWeapon: (AJKWeapon *)weapon
                         armor:(AJKArmor *)armor
                        health:(int)health
                          gold:(int)gold
{
    self = [super init];
    
    if (self) {
        _weapon = weapon;
        _armor = armor;
        _health = health;
        _damage = weapon.damage;
        _gold = gold;
    }
    return self;
}


@end
