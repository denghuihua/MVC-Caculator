//
//  CalculatorBrain.m
//  Caculator
//
//  Created by huihuadeng on 16/4/20.
//  Copyright © 2016年 huihuadeng. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain ()

@property(nonatomic,strong)NSMutableArray *oprenadStack;

@end

@implementation CalculatorBrain

-(NSMutableArray *)oprenadStack
{
    if (_oprenadStack == nil)
    {
        _oprenadStack= [[NSMutableArray alloc] init];
    }
    return _oprenadStack;
}

-(double)popOperand
{
    NSNumber *operand = [self.oprenadStack lastObject];
    if (operand)
    {
        [self.oprenadStack removeLastObject];
    }
    return [operand doubleValue];
}

-(void)pushOperand:(double)oprand
{
    [self.oprenadStack addObject:@(oprand)];
}

-(double)performOperation:(NSString *)operation
{
    double result = 0;
    // to do caculate result
    if ([operation isEqualToString:@"+"])
    {
        result = [self popOperand] + [self popOperand];
    }else if ([operation isEqualToString:@"-"])
    {
        result = [self popOperand] - [self popOperand];
    }else if ([operation isEqualToString:@"*"])
    {
        result = [self popOperand] * [self popOperand];
    }else if ([operation isEqualToString:@"/"])
    {
        result = [self popOperand] / [self popOperand];
    }
    [self pushOperand:result];
    return result;
}

@end
