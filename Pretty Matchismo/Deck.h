//
//  Deck.h
//  Matchismo
//
//  Created by liupeng on 13-3-21.
//  Copyright (c) 2013年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (Card *)drawRandomCard;
@end
