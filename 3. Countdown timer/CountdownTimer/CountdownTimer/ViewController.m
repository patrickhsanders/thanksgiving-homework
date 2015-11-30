//
//  ViewController.m
//  CountdownTimer
//
//  Created by Patrick Sanders on 27.11.15.
//  Copyright © 2015 turntotech. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIPickerView *minutePicker;
@property (strong, nonatomic) IBOutlet UILabel *outputDisplay;
@property (nonatomic, strong) NSTimer *timerToFinish;
@property (nonatomic, strong) NSTimer *viewTimer;
@property (nonatomic) NSUInteger countdownTimeInSeconds;
@property (nonatomic) AVAudioPlayer *audioPlayer;
@end

@implementation ViewController {
    SystemSoundID sound1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"alarm" withExtension:@"mp3"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
    [self.audioPlayer prepareToPlay];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 60;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *returnString = [NSString stringWithFormat:@"%lu",row];
    return returnString;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}
- (IBAction)timerControlTouched:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            NSLog(@"Set timer");
            [self setTimer];
            break;
        
        case 1:
            NSLog(@"Stopped timer");
            [_timerToFinish invalidate];
            [_viewTimer invalidate];
            break;
        
        default:
            break;
    }
}

- (void)setTimer{
    self.countdownTimeInSeconds = [self.minutePicker selectedRowInComponent:0] * 60;
    self.countdownTimeInSeconds += [self.minutePicker selectedRowInComponent:1];
    [self printDisplay:self.countdownTimeInSeconds];
    self.viewTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self selector:@selector(updateCountdownDisplay)
                                                    userInfo:nil repeats:YES];
    self.timerToFinish = [NSTimer scheduledTimerWithTimeInterval:self.countdownTimeInSeconds
                                     target:self selector:@selector(timerFinished)
                                   userInfo:nil repeats:NO];
}

- (void)timerFinished{
    NSLog(@"Timer done");
    [self.viewTimer invalidate];
    self.outputDisplay.text = @"0:00";
    [self.audioPlayer play];
//    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundURL), &sound1);
//    AudioServicesPlayAlertSound(sound1);
    AudioServicesPlaySystemSound (1003);
}

- (void)updateCountdownDisplay{
    [self printDisplay:self.countdownTimeInSeconds -1];
    self.countdownTimeInSeconds--;
}

- (void)printDisplay:(NSUInteger)secondsToDisplay{
    NSString *minutes = [NSString stringWithFormat:@"%lu",(secondsToDisplay) / 60];
    NSString *seconds;
    if(secondsToDisplay % 60 < 10){
        seconds = [NSString stringWithFormat:@"0%lu",(secondsToDisplay) % 60];
    } else {
        seconds = [NSString stringWithFormat:@"%lu",(secondsToDisplay) % 60];
    }
    self.outputDisplay.text = [NSString stringWithFormat:@"%@:%@",minutes,seconds];
}

@end
