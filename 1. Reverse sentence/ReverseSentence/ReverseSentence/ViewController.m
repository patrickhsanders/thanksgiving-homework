//
//  ViewController.m
//  ReverseSentence
//
//  Created by Patrick Sanders on 27.11.15.
//  Copyright © 2015 turntotech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *inputText;
@property (strong, nonatomic) IBOutlet UITextView *outputText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)convertText:(UIButton *)sender {
    NSMutableCharacterSet *spacesAndPunctuation = [NSMutableCharacterSet punctuationCharacterSet];
    [spacesAndPunctuation formUnionWithCharacterSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSArray *arrayOfWords = [self.inputText.text componentsSeparatedByCharactersInSet:spacesAndPunctuation];
    NSMutableString *string = [NSMutableString stringWithFormat:@""];

    NSUInteger location = 0;
    for(NSString *substring in arrayOfWords){
        [string insertString:substring atIndex:0];
        location += [substring length];
        if(location < [self.inputText.text length]){
        [string insertString:[self.inputText.text substringWithRange:NSMakeRange(location,1)] atIndex:0];
        location++;
        }
    }
    self.outputText.text = string;
}

@end
