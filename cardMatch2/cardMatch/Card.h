//
//  Card.h
//  cardMatch
//
//  Created by 羊琪 on 16/2/23.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString* contents;
@property (nonatomic, getter=ismatched) BOOL match;
@property (nonatomic, getter=ischosen) BOOL chosen;

- (int)match:(NSArray *)otherCard;
@end
