//
//  PlayingCard.h
//  Matchismo
//
//  Created by liupeng on 13-3-21.
//  Copyright (c) 2013年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card	

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
