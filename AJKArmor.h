//
//  AJKArmor.h
//  Pirate
//
//  Created by Alan Jaw on 7/7/14.
//  Copyright (c) 2014 AJK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJKArmor : NSObject
@property(strong, nonatomic)NSString *name;
@property(nonatomic)int health;

- (instancetype)initWithArmorName: (NSString *)name;

- (instancetype)initWithArmorName: (NSString *)name
                            health:(int)health;

@end
