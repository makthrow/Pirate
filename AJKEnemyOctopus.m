//
//  AJKEnemyOctopus.m
//  Pirate
//
//  Created by Alan Jaw on 7/14/14.
//  Copyright (c) 2014 AJK. All rights reserved.
//

#import "AJKEnemyOctopus.h"
#import "AJKStuddedLeather.h"
#import "AJKweaponFists.h"

@implementation AJKEnemyOctopus
- (instancetype)init
{
    
    self.weapon = [[AJKweaponFists alloc] init];
    self.armor = [[AJKStuddedLeather alloc] init];
    self.health = 500;
    self.damage = self.weapon.damage;
    self.gold = 50;
    
    return self;
}
@end
