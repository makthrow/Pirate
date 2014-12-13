//
//  AJKWeapon.h
//  Pirate
//
//  Created by Alan Jaw on 7/7/14.
//  Copyright (c) 2014 AJK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJKWeapon : NSObject

@property(nonatomic)int damage;
@property(strong, nonatomic)NSString *name;

// designated initializer
- (instancetype)initWithWeaponName: (NSString *)name
                            damage:(int)damage;

@end
