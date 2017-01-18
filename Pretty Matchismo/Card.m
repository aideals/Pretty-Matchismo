//
//  Card.m
//  Matchismo
//
//  Created by liupeng on 13-3-21.
//  Copyright (c) 2013年 liupeng. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards)
    {
        if ([card.contents isEqualToString:self.contents])
        {
            score = 1;
        }
    }
    return score;
}


@end
