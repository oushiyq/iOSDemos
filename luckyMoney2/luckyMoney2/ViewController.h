//
//  ViewController.h
//  luckyMoney2
//
//  Created by 羊琪 on 16/2/22.
//  Copyright © 2016年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *txtField;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *openButton;

- (IBAction)clickButton:(id)sender;

@end

