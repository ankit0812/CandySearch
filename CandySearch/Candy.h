//
//  Candy.h
//  CandySearch
//
//  Created by optimusmac4 on 9/10/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Candy : NSObject{
    NSString *imageName;
    NSString *category;
    NSString *name;
}

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *name;

+(id)candyOfType:(NSString *)imageName category:(NSString *)category name:(NSString *)name;

@end
