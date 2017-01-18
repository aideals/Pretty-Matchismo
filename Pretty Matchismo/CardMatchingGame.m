//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by liupeng on 13-3-23.
//  Copyright (c) 2013年 liupeng. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) int score;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return  _cards;
}

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck
{
    int i;
    
    self = [super init];
    
    if (self) {
      for (i = 0;i < cardCount;i++) {
             Card *card = [deck drawRandomCard];
             if (!card){
                self = nil;
            }
            else
            {
                self.cards[i] = card;
            }
                
            
        }
        
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.unPlayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unPlayable = YES;
                        card.unPlayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    }else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}

@end
