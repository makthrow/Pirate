//
//  AJKFactory.m
//  Pirate
//
//  Created by Alan Jaw on 7/7/14.
//  Copyright (c) 2014 AJK. All rights reserved.
//
 /*To create the tiles, you should implement a Factory class. This sounds complex, but in reality it is pretty straight forward. The Factory class will serve as an intermediary between our models and our View Controller. We should define a method that returns an NSArray of Tile objects. Within this method we can create 12 instance of our Tile class and set properties for our tile here. While not required, it is certainly recommended that you create 4 arrays that contain 3 tile objects. We then recommend wrapping all 4 arrays into a single array and returning it from your method. This is called an embedded method and was discussed in the Pirate Adventure Prereq videos.
 */

/*

 NSArray *tiles = Column 1 Array (tile 1, tile 2, tile 3), Column 2 Array (4, 5, 6), Colum 3 Array (7,8,9), Array 4 (10, 11, 12)
 
 Tile11 = [[tilesArray objectAtIndex:3] objectAtIndex:1];
 */

#import "AJKFactory.h"
#import "AJKArmor.h"
#import "AJKWeapon.h"
#import "AJKweaponFists.h"
#import "AJKCannon.h"
#import "AJKweaponPistol.h"
#import "AJKweaponSword.h"
#import "AJKClothArmor.h"
#import "AJKLeatherArmor.h"
#import "AJKStuddedLeather.h"
#import "AJKRingMail.h"
#import "AJKBreastPlate.h"
#import "AJKNoArmor.h"
#import "AJKEnemyPirate.h"
#import "AJKEnemyFrenchNavy.h"
#import "AJKEnemyBoss.h"
#import "AJKEnemyOctopus.h"

@implementation AJKFactory


-(NSArray *)getTileBoard {
    
    AJKTile *tile1 = [[AJKTile alloc] init];
    tile1.story = @"You are a pirate adventurer. In which direction shall we sail, Captain?";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile1.actionButtonName = @"Eat Fruit Before your journey (cost: 5 gold)";
//    tile1.weapon = [[AJKweaponFists alloc] init];
//    tile1.armor = [[AJKClothArmor alloc] init];
    tile1.healthEffect = 0;
    tile1.armorEffect = 0;
    tile1.goldEffect = 0;
    tile1.tileNumber = 1;
    tile1.actionHealthEffect = 10;
//    tile1.actionArmorEffect = 0;
    tile1.actionGoldEffect = -5;
    tile1.actionButtonClickedText = @"Fruit contains Vitamin C, which is good against scurvey. + 10 health.";


    AJKTile *tile2 = [[AJKTile alloc] init];
    tile2.story = @"You are sneak attacked by pirates! You lose 11 health.";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile2.actionButtonName = @"Fight";
//    tile2.weapon = [[AJKWeapon alloc] initWithWeaponName:@"no weapon" damage:0];
//    tile2.armor = [[AJKArmor alloc] initWithArmorName:@"tile 2 armor" health:8];
    tile2.healthEffect = -11;
    tile2.armorEffect = 0;
    tile2.goldEffect = 0;
//    tile2.tileNumber = 2;
//    tile2.actionHealthEffect = -40;
//    tile2.actionArmorEffect = -1;
    tile2.actionGoldEffect = -40;
    tile2.actionButtonClickedText = @"Your retaliation was ill-advised. You lose 40 health and 40 gold.";
    tile2.enemy = [[AJKEnemyPirate alloc] init];

    
    AJKTile *tile3 = [[AJKTile alloc] init];
    tile3.story = @"You have a drink with a skilled blacksmith. Gain 10 health.";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tile3.actionButtonName = @"Buy Sword and Ring Mail from blacksmith. Cost: 20 gold";
    tile3.weapon = [[AJKweaponSword alloc] init];
    tile3.armor = [[AJKRingMail alloc] init];
    tile3.healthEffect = 10;
    tile3.armorEffect = 0;
    tile3.goldEffect = -3;
//    tile3.tileNumber = 3;
    tile3.actionHealthEffect = 0;
//    tile3.actionArmorEffect = 0;
    tile3.actionGoldEffect = -20;
    tile3.actionButtonClickedText = @"You got sword and ring mail!";
    
    AJKTile *tile4 = [[AJKTile alloc] init];
    tile4.story = @"You stumble upon a cache of treasure, including a pistol. Gain 5 health.";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile4.actionButtonName = @"Take the pistol and treasure.";
    tile4.weapon = [[AJKweaponPistol alloc] init];
//    tile4.armor = [[AJKArmor alloc] initWithArmorName:@"tile 4 armor" health:8];
    tile4.healthEffect = 5;
    tile4.armorEffect = 0;
    tile4.goldEffect = 0;
//    tile4.tileNumber = 4;
    tile4.actionHealthEffect = 0;
//    tile4.actionArmorEffect = 0;
    tile4.actionGoldEffect = 75;
    tile4.actionButtonClickedText = @"You got a pistol and treasure (+75 gold)!";
    
    AJKTile *tile5 = [[AJKTile alloc] init];
    tile5.story = @"You dock at a friendly port and trade your goods for a Cannon. Gain 20 health and 30 gold.";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile5.actionButtonName = @"Trade goods for cannon. Cost: 60 gold";
    tile5.weapon = [[AJKCannon alloc] init];
//    tile5.armor = [[AJKArmor alloc] initWithArmorName:@"tile 5 armor" health:8];
    tile5.healthEffect = 20;
    tile5.armorEffect = 0;
    tile5.goldEffect = 30;
//    tile5.tileNumber = 5;
    tile5.actionHealthEffect = 0;
//    tile5.actionArmorEffect = 0;
    tile5.actionGoldEffect = -60;
    tile5.actionButtonClickedText = @"You got a cannon!";
    
    AJKTile *tile6 = [[AJKTile alloc] init];
    tile6.story = @"A deep sea giant octopus rocks your ship! Lose 20 health and 5 gold.";
    tile6.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
//    tile6.actionButtonName = @"Try to Run";
    tile6.actionButtonName = @"Fight";

//    tile6.weapon = [[AJKWeapon alloc] initWithWeaponName:@"tile 6 weap" damage:5];
//    tile6.armor = [[AJKArmor alloc] initWithArmorName:@"tile 6 armor" health:8];
    tile6.healthEffect = -20;
    tile6.armorEffect = 0;
    tile6.goldEffect = -5;
//    tile6.tileNumber = 6;
    tile6.actionHealthEffect = -50;
//    tile6.actionArmorEffect = 0;
    tile6.actionGoldEffect = -1000;
    tile6.actionButtonClickedText = @"The Octopus capsizes your ship. You lose 50 health and all your gold.";
    tile6.enemy = [[AJKEnemyOctopus alloc] init];
    tile6.hideLocButtons = YES;
    tile6.runFailureText = @"The Octopus capsizes your ship. You lose 50 health and all your gold.";
    tile6.runSuccessText = @"You escape the giant octopus.";
    
    AJKTile *tile7 = [[AJKTile alloc] init];
    tile7.story = @"A nice parrot wants to join your crew.";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    tile7.actionButtonName = @"Buy Parrot (10 gold)";
//    tile7.weapon = [[AJKWeapon alloc] initWithWeaponName:@"tile 7 weap" damage:5];
//    tile7.armor = [[AJKArmor alloc] initWithArmorName:@"tile 7 armor" health:8];
    tile7.healthEffect = 2;
    tile7.armorEffect = 0;
    tile7.goldEffect = -5;
//    tile7.tileNumber = 7;
    tile7.actionHealthEffect = 5;
//    tile7.actionArmorEffect = 0;
    tile7.actionGoldEffect = 30;
    tile7.actionButtonClickedText = @"Your new crew member, Parroty, makes you money as an entertainer at pirate ports! (+30 gold)";
    
    AJKTile *tile8 = [[AJKTile alloc] init];
    tile8.story = @"You are kidnapped, robbed, and forced to walk the plank. -20 health";
    tile8.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile8.actionButtonName = @"Try to Run";
//    tile8.weapon = [[AJKWeapon alloc] initWithWeaponName:@"tile 8 weap" damage:5];
//    tile8.armor = [[AJKArmor alloc] initWithArmorName:@"No Armor" health:0];
    tile8.weapon = nil;
    tile8.armor = nil;

    tile8.healthEffect = -20;
    tile8.armorEffect = -20000;
    tile8.goldEffect = -100000;
//    tile8.tileNumber = 8;
    tile8.actionHealthEffect = -90;
//    tile8.actionArmorEffect = 0;
    tile8.actionGoldEffect = 0;
    tile8.runFailureText = @"You slip and bust your head open on the plank, losing 90 health.";
    tile8.runSuccessText = @"You fall into the water, drowning, but are saved by mermaids.";
//    tile8.actionButtonClickedText = @"You slip and bust your head open on the plank, losing 90 health.";
    
    AJKTile *tile9 = [[AJKTile alloc] init];
    tile9.story = @"Parrot says: There ahead is the French Navy! Shall we fight?";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile9.actionButtonName = @"Fight";
//    tile9.weapon = [[AJKWeapon alloc] initWithWeaponName:@"tile 9 weap" damage:5];
//    tile9.armor = [[AJKArmor alloc] initWithArmorName:@"tile 9 armor" health:8];
    tile9.healthEffect = 0;
    tile9.armorEffect = 0;
    tile9.goldEffect = 0;
//    tile9.tileNumber = 9;
//    tile9.actionHealthEffect = -15;
//    tile9.actionArmorEffect = 0;
    tile9.actionGoldEffect = 100;
    tile9.actionButtonClickedText = @"You win the battle, losing 15 health but gaining 100 gold!";
    tile9.enemy = [[AJKEnemyFrenchNavy alloc] init];
    
    AJKTile *tile10 = [[AJKTile alloc] init];
    tile10.story = @"You find buried Pirate Treasure! (100 gold)";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile10.actionButtonName = @"Share some with the natives?";
//    tile10.weapon = [[AJKWeapon alloc] initWithWeaponName:@"tile 10 weap" damage:5];
    tile10.armor = [[AJKBreastPlate alloc] init];
    tile10.healthEffect = 5;
    tile10.armorEffect = 0;
    tile10.goldEffect = 100;
    //    tile9.tileNumber = 9;
    tile10.actionHealthEffect = 20;
//    tile10.actionArmorEffect = 17;
    tile10.actionGoldEffect = -25;
    tile10.actionButtonClickedText = @"You share 25 gold with the natives, who gratefully prepare a feast for you. There, they present you with a beautiful Breast Plate.";
    
    AJKTile *tile11 = [[AJKTile alloc] init];
    tile11.story = @"You meet some Pirates who want to trade weapons.";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tile11.actionButtonName = @"Trade with them?";
    tile11.weapon = [[AJKweaponFists alloc] init];
    tile11.armor = [[AJKNoArmor alloc] init];
    tile11.healthEffect = 0;
//    tile11.tileNumber = 11;
    tile11.armorEffect = 0;
    tile11.goldEffect = 100;
    tile11.actionHealthEffect = -15;
    tile11.actionArmorEffect = -100000;
    tile11.actionGoldEffect = -50;
    tile11.actionButtonClickedText = @"You setup a trade meeting. When you get there, you are ambushed, and they rob you blind! You lose 50 gold, your weapon, and your armor.";

    
    AJKTile *tile12 = [[AJKTile alloc] init];
    tile12.story = @"You meet the baddest pirate of them all, dread pirate lambergh. You are cornered and must fight.";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.actionButtonName = @"Fight";
//    tile12.weapon = [[AJKWeapon alloc] initWithWeaponName:@"tile 12 weap" damage:5];
//    tile12.armor = [[AJKArmor alloc] initWithArmorName:@"tile 12 armor" health:8];
    tile12.healthEffect = 0;
//    tile12.tileNumber = 12;
    tile12.armorEffect = 0;
    tile12.goldEffect = 0;
    tile12.actionHealthEffect = 0;
    tile12.actionArmorEffect = 0;
    tile12.actionGoldEffect = 0;
    tile12.actionButtonClickedText = @"You're fighting the pirate boss!";
    tile12.enemy = [[AJKEnemyBoss alloc] init];
    tile12.hideLocButtons = YES;
    
    NSArray *tileColumn1 = [[NSArray alloc] initWithObjects:tile1, tile2, tile3, nil];
    NSArray *tileColumn2 = [[NSArray alloc] initWithObjects:tile4, tile5, tile6, nil];
    NSArray *tileColumn3 = [[NSArray alloc] initWithObjects:tile7, tile8, tile9, nil];
    NSArray *tileColumn4 = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];
    
    NSArray *tileBoard = [[NSArray alloc] initWithObjects:tileColumn1, tileColumn2, tileColumn3, tileColumn4, nil];
    
    return tileBoard;
}


@end
