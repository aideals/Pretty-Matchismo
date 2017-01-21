//
//  ViewController.h
//  Matchismo
//
//  Created by 鹏 刘 on 2016/12/17.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCardDeck.h"
#import "PlayingCardGameCell.h"

@interface CardGameViewController : UIViewController
@property (nonatomic,assign) int flipCount;

- (IBAction)flipCard:(UIButton *)sender;

- (Deck *)createDeck;
@property (nonatomic) NSInteger startingCardCount;
- (void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card;
@end

