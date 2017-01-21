//
//  PlayingCardGameCell.h
//  Pretty Matchismo
//
//  Created by 鹏 刘 on 2017/1/19.
//  Copyright © 2017年 鹏 刘. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCardView.h"

@interface PlayingCardGameCell : UICollectionViewCell
@property (nonatomic, strong) PlayingCardView *playingCardView;

- (id)initWithFrame:(CGRect)frame;
@end
