//
//  ViewController.m
//  Matchismo
//
//  Created by 鹏 刘 on 2016/12/17.
//  Copyright © 2016年 鹏 刘. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "GameResult.h"
#import "PlayingCardGameCell.h"

@interface CardGameViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UILabel *scoreLabel;
@property (nonatomic, strong) UILabel *flipsLabel;
@property (nonatomic, strong) NSMutableArray *cardButtons;
@property (nonatomic, strong) CardMatchingGame *game;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIButton *dell;
@property (nonatomic, strong) GameResult *gameResult;
@property (nonatomic, strong) PlayingCardGameCell *playingCardGameCell;
@end

@implementation CardGameViewController
@synthesize flipCount = _flipCount;

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.startingCardCount usingDeck:[self createDeck]];
    return _game;
}

- (NSMutableArray *)cardButtons
{
    if (!_cardButtons) _cardButtons = [[NSMutableArray alloc] init];
    return _cardButtons;
}

- (Deck *)createDeck
{
    return nil;
}

- (void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];
    
    self.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 550, 85, 75)];
    self.scoreLabel.textColor = [UIColor blackColor];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
    [self.view addSubview:self.scoreLabel];
   
    self.flipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(295, 550, 85, 75)];
    self.flipsLabel.textColor = [UIColor blackColor];
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    [self.view addSubview:self.flipsLabel];

    UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipCard:)];
    [self.view addGestureRecognizer:tag];

    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 5;
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 25, self.view.bounds.size.width, 500) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor greenColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[PlayingCardGameCell class] forCellWithReuseIdentifier:@"PlayingCard"];
    [self.collectionView registerClass:[PlayingCardGameCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                         withReuseIdentifier:@"PlayingCard"];
    
    
    [self.view addSubview:self.collectionView];
    
    self.dell = [[UIButton alloc] initWithFrame:CGRectMake(155, 550, 55, 45)];
    self.dell.backgroundColor = [UIColor blackColor];
    [self.dell setTitle:@"Dell" forState:UIControlStateNormal];
    [self.dell addTarget:self action:@selector(dell:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.dell];

}

/*
#define x_space 25
#define y_space 45
*/

- (void)updateUI
{
    for (UICollectionViewCell *cell in [self.collectionView visibleCells]) {
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
        Card *card = [self.game cardAtIndex:indexPath.item];
        [self updateCell:cell usingCard:card];
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:%d",self.game.score];
}

- (IBAction)dell:(UIButton *)sender
{
    self.game = nil;
    self.gameResult = nil;
    self.flipCount = 0;
    [self updateUI];
}

#pragma mark - UICollectionDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.startingCardCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"PlayingCard";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    Card *card = [self.game cardAtIndex:indexPath.item];
    [self updateCell:cell usingCard:card];
    return cell;
}



/*
- (void)updateUI
{
    //if (!button) button为局部变量，每次调用updateUI,button都会被重置为nil
    //if (!self.cardButtons)
    if (self.cardButtons.count == 0) {
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                [self.cardButtons addObject:button];
                //Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:button]];
                button.layer.cornerRadius = 5.0;
                button.frame = CGRectMake(x_space + (x_space + 60) * j, y_space + (y_space + 95) * i, 70, 95);
                button.backgroundColor = [UIColor colorWithRed:0.3 green:0.7 blue:0.4 alpha:1.0];
                [button addTarget:self action:@selector(flipCard:) forControlEvents:UIControlEventTouchDown];
                [button setTitle:@"★" forState:UIControlStateNormal];
                [self.view addSubview:button];
            }
        }
    }
    else
    {
        / 错误的
         [button setTitle:card.contents forState:UIControlStateSelected];
         [button setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
         button.selected = card.isFaceUp;
         button.enabled = !card.isUnPlayable;
         button.alpha = card.isUnPlayable ? 0.3 : 1.0;
        /
        
        for (UIButton *button in self.cardButtons)
        {
           Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:button]];
           [button setTitle:card.contents forState:UIControlStateSelected];
           [button setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
           button.selected = card.isFaceUp;
           button.enabled = !card.isUnplayable;
           button.alpha = card.isUnplayable ? 0.3 : 1.0;
        }
        
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
}

*/


/*
- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    NSLog(@"%d",flipCount);
}
*/

- (IBAction)flipCard:(UITapGestureRecognizer *)gesture
{
    CGPoint tagLocation = [gesture locationInView:self.collectionView];
    NSIndexPath *path = [self.collectionView indexPathForItemAtPoint:tagLocation];
    if (path) {
        [self.game flipCardAtIndex:path.item];
        self.flipCount++;
        [self updateUI];
        
    }
}


@end
