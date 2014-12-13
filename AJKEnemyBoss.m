//
//  AJKEnemyBoss.m
//  Pirate
//
//  Created by Alan Jaw on 7/14/14.
//  Copyright (c) 2014 AJK. All rights reserved.
//

#import "AJKEnemyBoss.h"
#import "AJKweaponPistol.h"
#import "AJKRingMail.h"

@implementation AJKEnemyBoss
- (instancetype)init
{
    
    self.weapon = [[AJKweaponPistol alloc] init];
    self.armor = [[AJKRingMail alloc] init];
    self.health = 500;
    self.damage = self.weapon.damage;
    self.gold = 150;
    
    return self;
}
@end
