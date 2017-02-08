//
//  GameResultViewController.m
//  Pretty Matchismo
//
//  Created by 鹏 刘 on 2017/1/18.
//  Copyright © 2017年 鹏 刘. All rights reserved.
//

#import "GameResultViewController.h"
#import "GameResult.h"

@interface GameResultViewController () <UITextViewDelegate>
@property (nonatomic, strong) UIButton *sortByScore;
@property (nonatomic, strong) UIButton *sortByDate;
@property (nonatomic, strong) UIButton *sortByDurtion;
@property (nonatomic) SEL sortSelector;
@property (nonatomic, strong) UITextView *displayText;
@end

@implementation GameResultViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];
    
    self.sortByDate = [[UIButton alloc] initWithFrame:CGRectMake(35, 550, 40, 55)];
    [self.sortByDate setTitle:@"ByData" forState:UIControlStateNormal];
    [self.sortByDate addTarget:self action:@selector(sortByDate:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.sortByDate];
    
    self.sortByScore = [[UIButton alloc] initWithFrame:CGRectMake(95, 550, 40, 55)];
    [self.sortByScore setTitle:@"ByScore" forState:UIControlStateNormal];
    [self.sortByScore addTarget:self action:@selector(sortByScore:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.sortByScore];
    
    self.sortByDurtion = [[UIButton alloc] initWithFrame:CGRectMake(165, 550, 40, 55)];
    [self.sortByDurtion setTitle:@"ByDuration" forState:UIControlStateNormal];
    [self.sortByDurtion addTarget:self action:@selector(sortByDurtion:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.sortByDurtion];

}

- (void)updateUI
{
    self.displayText = [[UITextView alloc] initWithFrame:CGRectMake(0, 25, self.view.bounds.size.width, 475)];
    self.displayText.textColor = [UIColor blackColor];
    self.displayText.font = [UIFont fontWithName:@"Arial" size:20];
    self.displayText.backgroundColor = [UIColor whiteColor];
    self.displayText.delegate = self;
    
    NSString *display = @"";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    for (GameResult *result in [[GameResult allGameResults] sortedArrayUsingSelector:self.sortSelector]) {
        display = [display stringByAppendingString:@"Score: %d (%@, %0g)\n", result.score, [formatter stringFromDate:result.end], round(result.duration)];
    }
    
    self.displayText.text = display;
    [self.view addSubview:self.displayText];
}

@synthesize sortSelector = _sortSelector;

- (SEL)SortByDurtion
{
    if (!_sortSelector) _sortSelector = @selector(compareScoreToGameResult:);
    return _sortSelector;
}

- (void)setSortSelector:(SEL)sortSelector
{
    _sortSelector = sortSelector;
    [self updateUI];
}

- (IBAction)sortByDate:(UIButton *)sender
{
    self.sortSelector = @selector(compareToEndDateToGameResult:);
}

- (IBAction)sortByScore:(UIButton *)sender
{
    self.sortSelector = @selector(compareScoreToGameResult:);
}

- (IBAction)sortByDurtion:(UIButton *)sender
{
    self.sortSelector = @selector(compareDurationToGameResult:);
}


@end
