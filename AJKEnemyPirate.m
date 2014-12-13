//
//  AJKEnemyPirate.m
//  Pirate
//
//  Created by Alan Jaw on 7/14/14.
//  Copyright (c) 2014 AJK. All rights reserved.
//

#import "AJKEnemyPirate.h"
#import "AJKweaponSword.h"
#import "AJKClothArmor.h"
#import "AJKNoArmor.h"
#import "AJKweaponFists.h"

@implementation AJKEnemyPirate


- (instancetype)init
{
    
    self.weapon = [[AJKweaponFists alloc] init];
    self.armor = [[AJKNoArmor alloc] init];
    self.health = 30;
    self.damage = self.weapon.damage;
    self.gold = 20;
    
    return self;
}

@end
