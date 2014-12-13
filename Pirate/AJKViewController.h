//
//  AJKViewController.h
//  Pirate
//
//  Created by Alan Jaw on 7/7/14.
//  Copyright (c) 2014 AJK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJKTile.h"
#import "AJKCharacter.h"

@interface AJKViewController : UIViewController<UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *storyContentLabel;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UILabel *healthContentLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageContentLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorContentLabel;
@property (strong, nonatomic) IBOutlet UILabel *goldContentLabel;

@property (nonatomic) CGPoint location;

@property (strong, nonatomic) NSArray *tileBoard;
@property (strong, nonatomic) AJKTile *currentTile;

- (void)buttonHideOrShow:(AJKTile *)currentTile tileBoard:(NSArray *)tileBoard;
- (void)resetGame;
- (void)updateCurrentTile;

- (void) updateCharacterHealth: (int)healthEffect;
- (void) updateCharacterArmorFromTile;
- (void) updateCharacterArmorFromAction;

- (void) updateCharacterGold: (int)goldEffect;
- (BOOL) fightAction:(AJKTile *) currentTile;
- (BOOL) runAction:(AJKTile *) currentTile;
- (int) updateHealth: (int)currentHealth armor:(int)armor  damage:(int)damage;
- (void) hideLocButtons: (BOOL)hide;

@property (strong, nonatomic) IBOutlet UIButton *actionButtonLabel;
@property (strong, nonatomic) IBOutlet UILabel *actionClickedText;

@property (strong, nonatomic) AJKCharacter *character;

- (IBAction)actionButton:(UIButton *)sender;
- (IBAction)NButton:(id)sender;
- (IBAction)SButton:(id)sender;
- (IBAction)EButton:(id)sender;
- (IBAction)WButton:(id)sender;
- (IBAction)resetGameButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *NButtonLabel;
@property (strong, nonatomic) IBOutlet UIButton *EButtonLabel;
@property (strong, nonatomic) IBOutlet UIButton *SButtonLabel;
@property (strong, nonatomic) IBOutlet UIButton *WButtonLabel;

@end
