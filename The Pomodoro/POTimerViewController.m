//
//  POTimerViewController.m
//  The Pomodoro
//
//  Created by Daniel Bladh on 1/20/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "POTimerViewController.h"
#import "POHistoryViewController.h"

@interface POTimerViewController ()

@property (nonatomic, assign) BOOL active;

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@property (nonatomic, assign) NSInteger seconds;
@property (nonatomic, assign) NSInteger minutes;

@end

@implementation POTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startTimer:(id)sender {
    self.startButton.enabled = NO;
    [self.startButton setTitleColor:[UIColor grayColor] forState: UIControlStateNormal];
    self.active = YES;
    [self decreaseSecond];

}

-(void) decreaseSecond{
    if (self.seconds >0){
        self.seconds --;
    }
    if (self.minutes >0){
        if (self.self ==0){
            self.seconds = 59;
            self.minutes --;
        }
        
    }else{
        if (self.seconds ==0){
            self.startButton.enabled = YES;
            [self.startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.active = NO;
            
           // [[NSNotificationCenter defaultCenter] postNotificationName:RoundCompleteNotificationName object:nil userInfo: nil];
        }
    }
    [self updateLabel];
}

-(void) updateLabel{
    if (self.seconds <10){
        self.timerLabel.text = [NSString stringWithFormat:@"%lu:0%lu", self.minutes, self.seconds];
    }else{
        self.timerLabel.text = [NSString stringWithFormat:@"%lu:%lu", self.minutes, self.seconds];
    }
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
