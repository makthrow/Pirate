//
//  AJKEnemyFrenchNavy.m
//  Pirate
//
//  Created by Alan Jaw on 7/14/14.
//  Copyright (c) 2014 AJK. All rights reserved.
//

#import "AJKEnemyFrenchNavy.h"
#import "AJKweaponSword.h"
#import "AJKRingMail.h"

@implementation AJKEnemyFrenchNavy
- (instancetype)init
{
    
    self.weapon = [[AJKweaponSword alloc] init];
    self.armor = [[AJKRingMail alloc] init];
    self.health = 50;
    self.damage = self.weapon.damage;
    self.gold = 100;
    
    return self;
}

@end
