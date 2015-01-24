//
//  POHistoryViewController.m
//  The Pomodoro
//
//  Created by Daniel Bladh on 1/20/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "POHistoryViewController.h"
#import "POTimerViewController.h"  

static NSString * const CurrentRoundKey = @"CurrentRound";

@interface POHistoryViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger currentRound;

@end

@implementation POHistoryViewController

-(void)registerForNotifications{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endRound:) name:RoundCompleteNotificationName object:nil];
}

-(void)unregisterForNotifications{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:RoundCompleteNotificationName object:nil];
}

-(void)dealloc{
    [self unregisterForNotifications];
}

-(void)setCurrentRound:(NSInteger)currentRound {
    _currentRound = currentRound;
    
    [[NSUserDefaults standardUserDefaults] setValue:@(currentRound) forKeyPath:CurrentRoundKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Rounds";
    
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
