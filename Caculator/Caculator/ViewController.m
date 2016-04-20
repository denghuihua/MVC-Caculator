//
//  ViewController.m
//  Caculator
//
//  Created by huihuadeng on 16/4/20.
//  Copyright © 2016年 huihuadeng. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"
@interface ViewController ()
@property(nonatomic)BOOL userIsInTheMiddleOfEnteringANumber;
@property(nonatomic ,strong)CalculatorBrain *brain;
@end

@implementation ViewController

-(CalculatorBrain *)brain
{
    if (_brain == nil)
    {
        _brain=  [[CalculatorBrain alloc] init];
    }
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
        self.display.text = [self.display.text stringByAppendingString:digit];
    }else
    {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}

- (IBAction)enterPressed:(UIButton *)sender
{
    [self.brain pushOperand:[self.display.text doubleValue]];
     self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)opreationPressed:(UIButton *)sender
{
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
        [self enterPressed:nil];
    }
    double result = [self.brain performOperation:sender.currentTitle];
    self.display.text = [NSString stringWithFormat:@"%g",result];
}



@end
