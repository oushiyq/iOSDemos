//
//  playingCard.m
//  cardMatch
//
//  Created by 羊琪 on 16/2/23.
//  Copyright © 2016年 user. All rights reserved.
//

#import "playingCard.h"

@implementation playingCard
@synthesize suit = _suit;


//重写父类的match函数，当数字相同时，score+4，花色相同时，score+2
- (int)match:(NSArray *)otherCard{
    int score = 0;
    if ([otherCard count] == 1) {
        playingCard *othercard = [otherCard firstObject];
        if (othercard.rank == self.rank) {
            score = score + 4 ;
        }else if([othercard.suit isEqualToString:self.suit]){
            score = score + 2;
        }
    }
    return score;
    
}


+ (NSArray *)rankString{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}


+ (NSInteger)maxRank{
    return ([[self rankString] count] - 1);
}


- (NSString*)contents{
    NSArray *rankString= [playingCard rankString];
    return [rankString[self.rank] stringByAppendingString:self.suit];
}




+ (NSArray *)validSuit{
    return @[@"♠", @"❤", @"♣", @"◆"];
}

- (void)setSuit:(NSString *)suit{
    if ([[playingCard validSuit] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString*)suit{
    return _suit ? _suit : @"?";
}


@end
