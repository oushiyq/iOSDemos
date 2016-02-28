//
//  ViewController.m
//  cardMatch
//
//  Created by 羊琪 on 16/2/23.
//  Copyright © 2016年 user. All rights reserved.
//

#import "ViewController.h"
#import "playingDeck.h"
#import "gameRule.h"

@interface ViewController ()

@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) gameRule *rule;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UITextField *gotScores;

@end

@implementation ViewController


- (gameRule *)rule{
    if (!_rule) {
        _rule = [[gameRule alloc]initWithCardCount:[self.cardButtons count] fromDeck:self.deck];
    }
    return _rule;
}

- (Deck *)deck{
    if (!_deck) {
        _deck = [self creatDeck];
    }
    return _deck;

}

- (Deck *)creatDeck{
    return [[playingDeck alloc]init];
}



- (IBAction)openCard:(UIButton *)sender {
    NSUInteger chosenIndex = [self.cardButtons indexOfObject:sender];//根据点击的button来确定index
    [self.rule chooseCardAtIndex:chosenIndex];
    [self updateUI];
}

- (void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger chosenIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.rule cardAtIndex:chosenIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.ismatched;
        self.gotScores.text = [NSString stringWithFormat:@"Score: %ld",(long)self.rule.score];
        
    }

}


- (NSString *)titleForCard:(Card *)card{
    return  card.ischosen ? card.contents : @"???";//被选择取contents的值，否则翻到背面
}







@end
