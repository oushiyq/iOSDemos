//
//  gameRule.m
//  cardMatch
//
//  Created by 羊琪 on 16/2/23.
//  Copyright © 2016年 user. All rights reserved.
//

#import "gameRule.h"

@interface gameRule()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation gameRule

- (NSMutableArray*)cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSInteger)count
                         fromDeck:(Deck *)deck{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}


- (void)chooseCardAtIndex:(NSInteger)index{
    Card *card = [self cardAtIndex:index];
    if (!card.ismatched) {
        if (card.ischosen) {
            card.chosen = NO;//当牌已经被选，并且没match，翻面，chose置0
        }else
            for (Card *otherCard in self.cards) {
                if (otherCard.ischosen && !otherCard.ismatched) {
                    int matchScore = [card match:@[otherCard]];//如果match，matchscore被赋值，score加上matchscore
                    if (matchScore) {
                        self.score = self.score + matchScore;
                        card.match = YES;
                        otherCard.match = YES;
                    }else{
                        otherCard.chosen = NO;
                        self.score--;
                    }
                }
            }
            card.chosen = YES;//当翻面的牌被点击时，chosen置1
        
    }

}

- (Card *)cardAtIndex:(NSInteger)index{
    return index < [self.cards count] ? self.cards[index] : nil ;
//    return self.cards[index];
}

@end
