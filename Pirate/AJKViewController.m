//
//  AJKViewController.m
//  Pirate
//
//  Created by Alan Jaw on 7/7/14.
//  Copyright (c) 2014 AJK. All rights reserved.
//

#import "AJKViewController.h"

#import "Model"

#import "AJKTile.h"
#import "AJKFactory.h"
#import "AJKCharacter.h"
#import "AJKWeapon.h"
#import "AJKArmor.h"
#import "AJKBoss.h"
#import "AJKweaponFists.h"
#import "AJKweaponPistol.h"
#import "AJKweaponSword.h"
#import "AJKStuddedLeather.h"
#import "AJKLeatherArmor.h"
#import "AJKRingMail.h"
#import "AJKBreastPlate.h"
#import "AJKClothArmor.h"
#import "AJKCannon.h"
#import "AJKNoArmor.h"

@interface AJKViewController ()

@end

@implementation AJKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    AJKFactory *newFactory = [[AJKFactory alloc] init];
    self.tileBoard = [newFactory getTileBoard];

    self.location = CGPointMake(0, 0);

    AJKweaponFists *fists = [[AJKweaponFists alloc] init];
    AJKNoArmor *noArmor = [[AJKNoArmor alloc] init];
    self.character = [[AJKCharacter alloc] initWithWeapon:fists armor:noArmor health:100 gold:100];
    
    [self updateCurrentTile];
    
    [self buttonHideOrShow: self.currentTile tileBoard: self.tileBoard];
    
    
}
- (AJKTile *) whatTileAreYouOn {
    return [[self.tileBoard objectAtIndex:self.location.x] objectAtIndex:self.location.y];
}

- (void) updateCharacterHealth: (int)healthEffect {
    // NEGATIVE HEALTH EFFECT
    if (healthEffect < 0)
    {
        // ARMOR REDUCTION
        if (self.character.armor.health < healthEffect * -1) {
            int damage = (healthEffect * -1) - self.character.armor.health;
            
            self.character.health -= damage;
            
        }
    }
    else { // 0 and above health effect
        self.character.health += healthEffect;
    }
    
    if (self.character.health <= 0) {
        // TODO: Show message: you died. ALERT: restart game?.
        UIAlertView *restartAlert = [[UIAlertView alloc] initWithTitle:@"You died :(" message:@"Restarting the game." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [restartAlert show];
        [self resetGame];
        
    }

}

- (int)updateHealth: (int)currentHealth armor:(int)armor damage:(int)damage{

    // update health with armor REDUCTION
    int reducedDamage = damage - armor;
    
    if (reducedDamage <= 0) {
        reducedDamage = 1;
    }
    currentHealth -= reducedDamage;
    
    return currentHealth;
}

- (void) updateCharacterGold: (int)goldEffect {

    self.character.gold += goldEffect;
    if (self.character.gold < 0) {
        self.character.gold = 0;
    }

    
}

- (void) updateCharacterArmorFromTile {
    

    if (self.currentTile.armorEffect < 0) {
        AJKNoArmor *noArmor = [[AJKNoArmor alloc] init];
        self.character.armor = noArmor;
        self.armorLabel.text = self.character.armor.name;
        self.armorContentLabel.text = [NSString stringWithFormat:@"%i", self.character.armor.health];
    }
    
    else {
        self.armorLabel.text = self.character.armor.name;
        self.armorContentLabel.text = [NSString stringWithFormat:@"%i", self.character.armor.health];

    }
}

- (void) updateCharacterArmorFromAction{
    
    if (self.currentTile.armor) {
        self.character.armor = self.currentTile.armor;
        self.armorLabel.text = self.character.armor.name;
        self.armorContentLabel.text = [NSString stringWithFormat:@"%i", self.character.armor.health];
    }

    else {
        self.armorLabel.text = self.character.armor.name;
        self.armorContentLabel.text = [NSString stringWithFormat:@"%i", self.character.armor.health];
    }
}

- (void) takeWeapon {
    if (self.currentTile.weapon) {
        self.character.weapon = self.currentTile.weapon;
        
    }
}

- (BOOL) fightAction:(AJKTile *) currentTile{
    
    int enemyHealth = currentTile.enemy.health;
    
    while (self.character.health > 0 && enemyHealth > 0) {
        float yourMove = arc4random_uniform(10);
        float enemyMove = arc4random_uniform(10);
        
        if (yourMove >= enemyMove) {
            enemyHealth = [self updateHealth:enemyHealth armor:currentTile.enemy.armor.health damage:self.character.weapon.damage];
        }
        else {
            self.character.health = [ self updateHealth:self.character.health armor:self.character.armor.health damage:currentTile.enemy.weapon.damage];
        }
    }
    
    if (self.character.health > 0 && enemyHealth <= 0) {
        NSLog(@"You won the fight");
        return YES;
    }
    else if (self.character.health <= 0) {
        NSLog(@"You lost the fight");
        return NO;
    }
    else {
        return NO;
    }
}
- (BOOL) runAction:(AJKTile *)currentTile {
    
    // 10% chance of not getting away
    
    // 0-9 (10 numbers)
    if (arc4random_uniform(10) == 0){
        return NO;
    }
    return YES;
}


- (void) updateCurrentTile {
    // update current tile
    self.currentTile = [self whatTileAreYouOn];
    
    self.backgroundImage.image = self.currentTile.backgroundImage;
    
    self.storyContentLabel.text = self.currentTile.story;
    
    [self updateCharacterHealth:self.currentTile.healthEffect];
    [self updateCharacterGold:self.currentTile.goldEffect];
    [self updateCharacterArmorFromTile];
    
    self.healthContentLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageContentLabel.text = [NSString stringWithFormat:@"%i", self.character.weapon.damage];
    self.armorContentLabel.text = [NSString stringWithFormat:@"%i", self.character.armor.health];
    self.goldContentLabel.text = [NSString stringWithFormat:@"%i", self.character.gold];
    
    self.weaponLabel.text = self.character.weapon.name;
    self.actionClickedText.text = nil;
    
    [self buttonHideOrShow: self.currentTile tileBoard: self.tileBoard];
    
    [self.actionButtonLabel setTitle:self.currentTile.actionButtonName forState:(UIControlStateNormal)];
    [self.actionButtonLabel setEnabled:YES];

}

- (IBAction)actionButton:(UIButton*)sender {
    
    //dynamically generate the actionButtonName
    [sender setTitle:[NSString stringWithFormat:@"%@", self.currentTile.actionButtonName] forState:UIControlStateNormal];
    
    if ([self.currentTile.actionButtonName isEqualToString:@"Fight"]){
        // keep track of current health
        int startingHealth = self.character.health;
        
        if ([self fightAction:self.currentTile]){
            
            // you won the fight
            
            int healthLost = startingHealth - self.character.health;
            
            [self updateCharacterGold:self.currentTile.enemy.gold];
            self.actionClickedText.text = [NSString stringWithFormat:@"You win! You lost %i health and gain %i gold", healthLost, self.currentTile.enemy.gold];
            
            self.currentTile.hideLocButtons = NO;
            [self buttonHideOrShow:self.currentTile tileBoard:self.tileBoard];
            
            [sender setEnabled:NO];
        }
        else {
            UIAlertView *restartAlert = [[UIAlertView alloc] initWithTitle:@"You died :(" message:@"Restarting the game." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [restartAlert show];
            [self resetGame];
            [sender setEnabled:YES];
            
        }
    }
    
    else if ([self.currentTile.actionButtonName isEqualToString:@"Try to Run"] ){
        if ([self runAction:self.currentTile]){
            self.actionClickedText.text = self.currentTile.runSuccessText;

            self.currentTile.hideLocButtons = NO;
            [self buttonHideOrShow:self.currentTile tileBoard:self.tileBoard];
            [sender setEnabled:NO ];
        }
        else {
            self.actionClickedText.text = self.currentTile.runFailureText;
            [self updateCharacterHealth:self.currentTile.actionHealthEffect];
            [self updateCharacterGold:self.currentTile.actionGoldEffect];
            [sender setEnabled:YES ];
        }
    }
    
    else {
        
        [self updateCharacterHealth:self.currentTile.actionHealthEffect];
        [self updateCharacterGold:self.currentTile.actionGoldEffect];
        [self updateCharacterArmorFromAction];
        [self takeWeapon];
        // update the action button text if not fight or run
        self.actionClickedText.text = self.currentTile.actionButtonClickedText;
        
        [sender setEnabled:NO ];
        
    }
    
    self.healthContentLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageContentLabel.text = [NSString stringWithFormat:@"%i", self.character.weapon.damage];
    self.armorContentLabel.text = [NSString stringWithFormat:@"%i", self.character.armor.health];
    self.weaponLabel.text = self.character.weapon.name;
    self.goldContentLabel.text = [NSString stringWithFormat:@"%i", self.character.gold];
}

- (void)buttonHideOrShow:(AJKTile *)currentTile tileBoard:(NSArray *)tileBoard{
    // find length of the array (horizontal), then length of first array (vertical)
    // these are our tile bounds
    int horizontalTiles = [tileBoard count];
    int verticalTiles = [[tileBoard objectAtIndex:0] count];
    
    //NButton Check
    if (self.location.y < verticalTiles - 1){
        self.NButtonLabel.hidden = NO;
    }
    else {
        self.NButtonLabel.hidden = YES;
    }
    //SButton Check
    if (self.location.y > 0){
        self.SButtonLabel.hidden = NO;
    }
    else {
        self.SButtonLabel.hidden = YES;
    }
    //EButton Check
    if (self.location.x < horizontalTiles - 1) {
        self.EButtonLabel.hidden = NO;
    }
    else {
        self.EButtonLabel.hidden = YES;
    }
    //WButton Check
    if (self.location.x > 0) {
        self.WButtonLabel.hidden = NO;
    }
    else {
        self.WButtonLabel.hidden = YES;
    }
    
    // if at boss tile, hide all N W E S buttons
    if (self.currentTile.hideLocButtons) {
        [self hideLocButtons:YES];
    }
}

- (void) hideLocButtons:(BOOL)hide {
    if (hide) {
        self.NButtonLabel.hidden = YES;
        self.SButtonLabel.hidden = YES;
        self.EButtonLabel.hidden = YES;
        self.WButtonLabel.hidden = YES;
    }
    if (!hide) {
        self.NButtonLabel.hidden = NO;
        self.SButtonLabel.hidden = NO;
        self.EButtonLabel.hidden = NO;
        self.WButtonLabel.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) resetGame {
    self.location = CGPointMake(0, 0);
    AJKFactory *newFactory = [[AJKFactory alloc] init];
    self.tileBoard = newFactory.getTileBoard;
    
    AJKweaponFists *fists = [[AJKweaponFists alloc] init];
    AJKArmor *clothArmor = [[AJKClothArmor alloc] init];
    self.character = [[AJKCharacter alloc] initWithWeapon:fists armor:clothArmor health:100 gold:100];
    
    [self updateCurrentTile];
    
}


- (IBAction)NButton:(id)sender {
    
    // take the count of one of the arrays in the tileboard. in this case, the first.
    // if the count is 3, then the coordinates should only be 0, 1, and 2.
    // at count - 1, you are at the edge, and shouldn't be able to move further North.
    if (self.location.y < [[self.tileBoard objectAtIndex:0] count] - 1){
        self.location = CGPointMake(self.location.x, self.location.y + 1);
    }
    
    [self updateCurrentTile];

}

- (IBAction)SButton:(id)sender {
    
    if (self.location.y > 0) {
        self.location = CGPointMake(self.location.x, self.location.y - 1);
    }
    
    [self updateCurrentTile];

}

- (IBAction)EButton:(id)sender {
    
    if (self.location.x < [self.tileBoard count] - 1){
        self.location = CGPointMake(self.location.x + 1, self.location.y);
    }
    [self updateCurrentTile];

}

- (IBAction)WButton:(id)sender {
    
    if (self.location.x > 0) {
        self.location = CGPointMake(self.location.x - 1, self.location.y);
    }
    [self updateCurrentTile];

}



- (IBAction)resetGameButton:(id)sender {
    
    UIAlertView *restartAlert = [[UIAlertView alloc] initWithTitle:nil message:@"Restart the game?" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:@"Yes", nil];
    [restartAlert show];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        // do nothing
    }
    else if (buttonIndex == 1) {
        [self resetGame];
    
    }
}
@end
