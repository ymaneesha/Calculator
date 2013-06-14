//
//  ViewController.h
//  CalculatorBlock
//
//  Created by Maneesha on 5/14/13.
//  Copyright (c) 2013 Maneesha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *firstNumberLabel;

@property (weak, nonatomic) IBOutlet UILabel *operatorLabel;

@property (weak, nonatomic) IBOutlet UILabel *secondNumberLabel;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

-(IBAction)operationButtons:(id)sender;

- (IBAction)totalButton:(id)sender;




@end
