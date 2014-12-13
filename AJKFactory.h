//
//  AJKFactory.h
//  Pirate
//
//  Created by Alan Jaw on 7/7/14.
//  Copyright (c) 2014 AJK. All rights reserved.
//

/*To create the tiles, you should implement a Factory class. This sounds complex, but in reality it is pretty straight forward. The Factory class will serve as an intermediary between our models and our View Controller. We should define a method that returns an NSArray of Tile objects. Within this method we can create 12 instance of our Tile class and set properties for our tile here. While not required, it is certainly recommended that you create 4 arrays that contain 3 tile objects. We then recommend wrapping all 4 arrays into a single array and returning it from your method. This is called an embedded method and was discussed in the Pirate Adventure Prereq videos.
*/


#import <Foundation/Foundation.h>
#import "AJKTile.h"

@interface AJKFactory : NSObject

@property (strong, nonatomic) NSArray *tilesArray;

-(NSArray *)getTileBoard;

@end
