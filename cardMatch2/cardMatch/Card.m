//
//  Card.m
//  cardMatch
//
//  Created by 羊琪 on 16/2/23.
//  Copyright © 2016年 user. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCard{
    int score = 0;
    for (Card* card in otherCard) {
        if ([card.contents isEqualToString:self.contents]) {
            score++;
        }
    }
    
    return score;
    
}

@end
