//
//  ViewController.m
//  chessBoard
//
//  Created by Patrick Sanders on 27.11.15.
//  Copyright © 2015 turntotech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *squares;
@property (nonatomic, strong) UIView *squareDisplay;
@end

@implementation ViewController{
    UITextField *x;
    //UITextField *y;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.squares = [[NSMutableArray alloc] init];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, self.view.bounds.size.width / 4 - 5, 30)];
    label.text = @"Enter size:";
    label.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:label];
    
    x = [[UITextField alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 4 + 10, 25, self.view.bounds.size.width / 4 - 15, 30)];
    x.placeholder = @"x";
    x.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:x];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2, 25, self.view.bounds.size.width / 2 - 10, 30)];
    [button setTitle:@"Make squares" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(makeSquares) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:button];
    
    self.squareDisplay = [[UIView alloc] initWithFrame:CGRectMake(10, 65, self.view.bounds.size.width - 20, self.view.bounds.size.height - 75)];
    [self.view addSubview:self.squareDisplay];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeSquares{
    if([self.squares count] != 0){
        for(UIButton *button in self.squares){
            [button removeFromSuperview];
        }
    }
    
    NSUInteger xInt = [x.text integerValue];
    //NSUInteger yInt = [y.text integerValue];
    float squareSize;
    if(self.squareDisplay.bounds.size.width < self.squareDisplay.bounds.size.height){
        squareSize = self.squareDisplay.bounds.size.width / xInt;
    } else {
        squareSize = self.squareDisplay.bounds.size.height / xInt;
    }
    
    for (int i = 0; i < xInt; i++){
        for(int j = 0; j < xInt; j++){
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame = CGRectMake((float)i*squareSize, (float)j*squareSize, squareSize, squareSize);
            //if the goal was to make alternating color squares, this would be used in place of the if statement
            //button.backgroundColor = (i+j)%2 == 0 ? [UIColor lightGrayColor] : [UIColor clearColor];
            if((i+j)%2 == 0){
                button.backgroundColor = [UIColor lightGrayColor];
                [self.squareDisplay addSubview:button];
                [self.squares addObject:button];
            }

        }
    }

    
}

@end
