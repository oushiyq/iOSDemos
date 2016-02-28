//
//  playingCard.h
//  cardMatch
//
//  Created by 羊琪 on 16/2/23.
//  Copyright © 2016年 user. All rights reserved.
//

#import "Card.h"

@interface playingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSInteger rank;

+ (NSArray *)validSuit;
+ (NSInteger)maxRank;


@end
