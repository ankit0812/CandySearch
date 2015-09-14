//
//  Candy.m
//  CandySearch
//
//  Created by optimusmac4 on 9/10/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import "Candy.h"

@implementation Candy

@synthesize name;
@synthesize imageName;
@synthesize category;

+(id)candyOfType:(NSString *)imageName category:(NSString *)category name:(NSString *)name  {
    
    Candy *newCandy = [[self alloc] init];
    [newCandy setImageName:imageName];
    [newCandy setName:name];
    [newCandy setCategory:category];
    
    return newCandy;
}
@end
