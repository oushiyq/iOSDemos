//
//  Deck.m
//  cardMatch
//
//  Created by 羊琪 on 16/2/23.
//  Copyright © 2016年 user. All rights reserved.
//

#import "Deck.h"
@interface Deck()

@property (nonatomic, strong) NSMutableArray *cards;

@end


@implementation Deck

- (NSMutableArray *)cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

- (void)addCard:(Card*)card{
    
    [self.cards addObject:card];

}

//从deck中随意抽出一张牌
- (Card*)drawRandomCard{
    Card *randomCard = nil;
    unsigned index = arc4random() % self.cards.count;
    randomCard = self.cards[index];
    [self.cards removeObject:randomCard];
    return randomCard;
}



@end
