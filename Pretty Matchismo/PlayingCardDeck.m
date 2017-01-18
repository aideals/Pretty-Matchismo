//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by liupeng on 13-3-21.
//  Copyright (c) 2013年 liupeng. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (id)init
{
    self = [super init];
    
    if (self)
    {
      for (NSString *suit in [PlayingCard validSuits])
      {
          for (NSUInteger rank = 1;rank <= [PlayingCard maxRank]; rank++)
          {
              PlayingCard *card = [[PlayingCard alloc] init];
              card.rank = rank;
              card.suit = suit;
              [self addCard:card atTop:YES];
          }
      }
    }
    return self;
}
@end

