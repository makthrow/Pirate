//
//  AJKEnemy.h
//  Pirate
//
//  Created by Alan Jaw on 7/14/14.
//  Copyright (c) 2014 AJK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AJKWeapon.h"
#import "AJKArmor.h"


@interface AJKEnemy : NSObject

@property (strong, nonatomic) AJKWeapon *weapon;
@property (strong, nonatomic) AJKArmor *armor;
@property (nonatomic) int damage;
@property (nonatomic) int health;
@property (nonatomic) int gold;

@end
