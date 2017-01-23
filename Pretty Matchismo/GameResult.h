//
//  GameResult.h
//  Pretty Matchismo
//
//  Created by 鹏 刘 on 2017/1/21.
//  Copyright © 2017年 鹏 刘. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject
@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (nonatomic) int score;
@property (nonatomic) NSTimeInterval *duration;

+ (NSArray *)allGameResults;

- (NSComparisonResult)compareToEndDateToGameResult:(GameResult *)otherResult;
- (NSComparisonResult)compareScoreToGameResult:(GameResult *)otherResult;
- (NSComparisonResult)compareDurationToGameResult:(GameResult *)otherResult;


@end
