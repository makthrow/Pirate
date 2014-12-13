//
//  AJKTile.h
//  Pirate
//
//  Created by Alan Jaw on 7/7/14.
//  Copyright (c) 2014 AJK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AJKArmor.h"
#import "AJKWeapon.h"
#import "AJKEnemy.h"

@interface AJKTile : NSObject

@property(strong, nonatomic) NSString *story;
@property(strong, nonatomic) UIImage *backgroundImage;
@property(strong, nonatomic) NSString *actionButtonName;
@property(strong, nonatomic) NSString *actionButtonClickedText;

@property(strong, nonatomic) AJKWeapon *weapon;
@property(strong, nonatomic) AJKArmor *armor;
@property(nonatomic) int healthEffect;
@property(nonatomic) int armorEffect;
@property(nonatomic) int goldEffect;
@property(nonatomic) int tileNumber;
@property(strong, nonatomic) NSString *actionName;
@property(nonatomic) int actionHealthEffect;
@property(nonatomic) int actionArmorEffect;
@property(nonatomic) int actionGoldEffect;
@property(strong, nonatomic) AJKEnemy *enemy;
@property(strong, nonatomic) NSString *runSuccessText;
@property(strong, nonatomic) NSString *runFailureText;

@property(nonatomic) BOOL hideLocButtons;

@property (nonatomic) int locationXValue;
@property (nonatomic) int locationYValue;

@end
