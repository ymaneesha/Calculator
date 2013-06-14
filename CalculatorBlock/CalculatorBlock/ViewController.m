//
//  ViewController.m
//  CalculatorBlock
//
//  Created by Maneesha on 5/14/13.
//  Copyright (c) 2013 Maneesha. All rights reserved.
//

#import "ViewController.h"

typedef float  (^MathBlock) (float x, float y);

@interface ViewController ()
{

    BOOL operationselected;
    NSString *selectedOperator;
    NSString *firstString;
    NSString *secondString;

}

@property (strong, nonatomic)MathBlock additionBlock;

@property (strong, nonatomic)MathBlock subtractBlock;

@property (strong, nonatomic)MathBlock multiplyBlock;

@property (strong, nonatomic)MathBlock divisionBlock;

-(void)calculateWithNumbers:(float)x andNumber:(float)y withBlock:(MathBlock)mathBlock;


- (IBAction)clearButton:(id)sender;



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    firstString = @"";
    secondString = @"";
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)numberButton:(id)sender
{
    
    NSString *selectedNumber = [[sender titleLabel]text];
    NSLog(@"The number %@" ,selectedNumber);
    
    if (operationselected) {
        secondString = [NSString stringWithFormat:@"%@%@",   secondString, selectedNumber];
        self.secondNumberLabel.text = secondString;
        

    } else {
        self.firstNumberLabel.text = selectedNumber;
        
        firstString = [NSString stringWithFormat:@"%@%@",   firstString, selectedNumber];
        self.firstNumberLabel.text = firstString;
        

    }
    


    
}

-(IBAction)operationButtons:(id)sender
{
    
    
    if (operationselected == YES) {
        [self totalButton:sender];
        firstString = self.totalLabel.text;
        secondString =@" ";
        self.firstNumberLabel.text = firstString;
        self.secondNumberLabel.text = @" ";
    }
    selectedOperator = [[sender titleLabel]text];
    self.operatorLabel.text = selectedOperator;
    operationselected = YES;
    
    
    
    
    

    
}

- (IBAction)totalButton:(id)sender {
    
    NSString *totalSelected = [[sender titleLabel]text];
    self.totalLabel.text = totalSelected;
    
    
    self.additionBlock = ^float(float x, float y){
        return (x + y);
    };
    
    self.subtractBlock = ^float(float x, float y){
        return (x - y);
    };
    
    self.multiplyBlock = ^float(float x, float y){
        return (x * y);
    };
    
    self.divisionBlock = ^float(float x, float y){
        return (x/y);
    };
    
    MathBlock mathBlock;

    if ([selectedOperator isEqualToString:@"+"]) {
        mathBlock = self.additionBlock;
    } else if
        ([selectedOperator isEqualToString:@"-"]){
            mathBlock = self.subtractBlock;
    }
     else if
         ([selectedOperator isEqualToString:@"*"]){
             
             mathBlock = self.multiplyBlock;
         }
    else if
        ([selectedOperator isEqualToString:@"/"]){
            mathBlock = self.divisionBlock;
        }
[self calculateWithNumbers:[self.firstNumberLabel.text floatValue]
                 andNumber:[self.secondNumberLabel.text floatValue]
                 withBlock:mathBlock];


}

-(void)calculateWithNumbers:(float)x andNumber:(float)y withBlock:(MathBlock)mathBlock
{
    float answer = mathBlock (x, y);
    self.totalLabel.text = [NSString stringWithFormat:@"%f",answer];
    
}

- (IBAction)clearButton:(id)sender {
    
    self.firstNumberLabel.text = nil;
    self.operatorLabel.text = nil;
    self.secondNumberLabel.text = nil;
   self.totalLabel.text = nil;
    operationselected = NO;
    
    firstString =@" ";
    secondString =@" ";
    selectedOperator =@" ";
    
    
   //[self nil];
}





@end
