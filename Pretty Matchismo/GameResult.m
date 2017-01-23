//
//  GameResult.m
//  Pretty Matchismo
//
//  Created by 鹏 刘 on 2017/1/21.
//  Copyright © 2017年 鹏 刘. All rights reserved.
//

#import "GameResult.h"

@interface GameResult ()
@property (nonatomic, readwrite) NSDate *start;
@property (nonatomic, readwrite) NSDate *end;
@end


@implementation GameResult

#define ALL_GARM_RESULTS_KEY @"allGame"
#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"

+ (NSArray *)allGameResults
{
    NSMutableArray *allResults = [[NSMutableArray alloc] init];
    
    for (id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_GARM_RESULTS_KEY] mutableCopy]) {
        GameResult *gameResult = [[GameResult alloc] initFromPlist:plist];
        [allResults addObject:gameResult];
    }
    return allResults;
}

- (id)initFromPlist:(id)plist
{
    self = [self init];
    if (self) {
        if ([plist isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dic = (NSDictionary *)plist;
            _start = dic[START_KEY];
            _end = dic[END_KEY];
            _score = [dic[SCORE_KEY] intValue];
            if (!_start || !_end)
                return nil;
        }

    }
    return self;
}

- (id)PropertyList
{
    return @{START_KEY : self.start, END_KEY : self.end, SCORE_KEY : @(self.score)};
}






- (id)init
{
    self = [super init];
    if (self) {
        self.end = [NSDate date];
        
    }
    return self;
}





@end
