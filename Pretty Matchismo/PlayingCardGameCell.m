//
//  PlayingCardGameCell.m
//  Pretty Matchismo
//
//  Created by 鹏 刘 on 2017/1/19.
//  Copyright © 2017年 鹏 刘. All rights reserved.
//

#import "PlayingCardGameCell.h"

@implementation PlayingCardGameCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.playingCardView.frame = CGRectMake(0, 0, 40, 55);
    [self addSubview:self.playingCardView];
    return self;
}


@end
