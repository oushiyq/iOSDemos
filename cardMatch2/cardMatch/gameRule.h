//
//  gameRule.h
//  cardMatch
//
//  Created by 羊琪 on 16/2/23.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface gameRule : NSObject

- (instancetype)initWithCardCount:(NSInteger)count
                         fromDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSInteger)index;
- (Card *)cardAtIndex:(NSInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
