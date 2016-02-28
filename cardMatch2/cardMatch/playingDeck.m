//
//  playingDeck.m
//  cardMatch
//
//  Created by 羊琪 on 16/2/23.
//  Copyright © 2016年 user. All rights reserved.
//

#import "playingDeck.h"
#import "playingCard.h"

@implementation playingDeck


//生成一副牌
- (instancetype)init{
    self = [super init];
    if (self) {
        for (NSString *suit in [playingCard validSuit]) {
            for (int i = 1; i <= [playingCard maxRank]; i++) {
                playingCard *card = [[playingCard alloc]init];
                card.suit = suit;
                card.rank = i;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
