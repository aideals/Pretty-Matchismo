//
//  Card.h
//  Matchismo
//
//  Created by liupeng on 13-3-21.
//  Copyright (c) 2013年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unPlayable;

- (int)match:(NSArray *)otherCards;
@end
