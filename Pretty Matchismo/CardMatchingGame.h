//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by liupeng on 13-3-23.
//  Copyright (c) 2013年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;
@end
