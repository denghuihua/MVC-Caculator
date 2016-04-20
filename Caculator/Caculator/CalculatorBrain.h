//
//  CalculatorBrain.h
//  Caculator
//
//  Created by huihuadeng on 16/4/20.
//  Copyright © 2016年 huihuadeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void)pushOperand:(double)oprand;
-(double)performOperation:(NSString *)operation;

@end
