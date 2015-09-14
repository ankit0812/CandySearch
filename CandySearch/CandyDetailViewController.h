//
//  CandyDetailViewController.h
//  CandySearch
//
//  Created by optimusmac4 on 9/14/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CandyDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *candyImage;

@property (weak, nonatomic) IBOutlet UILabel *candyName;

@property (weak, nonatomic) NSString *actualName;
@property (weak, nonatomic) NSString *imageName;

@end
