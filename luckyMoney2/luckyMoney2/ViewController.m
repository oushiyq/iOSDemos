//
//  ViewController.m
//  luckyMoney2
//
//  Created by 羊琪 on 16/2/22.
//  Copyright © 2016年 user. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSUInteger selectNum;
    NSArray *money;
}

@property (nonatomic, strong) NSArray *money;

- (NSArray*)disMoney;


@end

@implementation ViewController

@synthesize money;
@synthesize txtField;
@synthesize openButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.money = [self disMoney];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray*)disMoney{
    float tmpMoney[5];
    float maxMoney = 99.96;//第一个人最多只能抢到99.96元
    float sum = 0 ;
    NSMutableArray *luckyMoney = [[NSMutableArray alloc]init];
    
    //红包分配
    for (int i = 0; i < 5; i++) {
        if (i != 0) {
            //当第一个人抢完后，从第二人开始最大红包减去前一个红包
            maxMoney -= tmpMoney[i - 1];
        }
        if (i != 4) {
            tmpMoney[i] = arc4random() % 100 / 100.00 * maxMoney;//生成0~maxMoney之间的随机数
            int a = (int)(tmpMoney[i] * 100 + 0.5);
            tmpMoney[i] = a / 100.0 + 0.01;//四舍五入，取两位小数
            NSString *tmp = [NSString stringWithFormat:@"%.2f",tmpMoney[i] ];
            [luckyMoney addObject:tmp];
        }
        else{
            tmpMoney[i] = 100 - sum;
            NSString *tmp = [NSString stringWithFormat:@"%.2f",tmpMoney[i] ];
            [luckyMoney addObject:tmp];
        }
        sum += tmpMoney[i];
        
    }

    return luckyMoney;
}




- (IBAction)clickButton:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"恭喜您抢到"
                                                                             message:money[selectNum]
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    NSUInteger buttonIndex = [self.openButton indexOfObject:sender];
    UITextField *tmpTxtField = [self.txtField objectAtIndex:buttonIndex];
    UIButton *tmpButton = [self.openButton objectAtIndex:buttonIndex];
    [tmpButton setEnabled:NO];
    tmpTxtField.text = money[selectNum];
    selectNum++;
    
}




@end
