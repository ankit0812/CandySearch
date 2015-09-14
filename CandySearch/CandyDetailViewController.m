//
//  CandyDetailViewController.m
//  CandySearch
//
//  Created by optimusmac4 on 9/14/15.
//  Copyright (c) 2015 optimusmac4. All rights reserved.
//

#import "CandyDetailViewController.h"

@interface CandyDetailViewController ()

@end

@implementation CandyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _candyName.text = _actualName;
    _candyImage.image =  [UIImage imageNamed:_imageName];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
