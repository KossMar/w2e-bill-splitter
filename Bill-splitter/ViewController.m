//
//  ViewController.m
//  Bill-splitter
//
//  Created by Mar Koss on 2017-10-13.
//  Copyright © 2017 Mar Koss. All rights reserved.
//

#import "ViewController.h"
#import "Slider.h"

@interface ViewController () <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *totalCostTextField;
@property (weak, nonatomic) IBOutlet Slider *slider;
@property (weak, nonatomic) IBOutlet UILabel *sliderValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *splitCostTextField;

//@property (nonatomic) NSArray *numbers;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.totalCostTextField.delegate = self;
    self.slider.maximumValue = 8;
    self.slider.minimumValue = 0;
    self.slider.value = 0;
    self.sliderValueLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.slider.value+2];
    self.slider.continuous = YES;
    self.totalCostTextField.keyboardType = UIKeyboardTypeDecimalPad;
    self.slider.tintColor = [UIColor orangeColor];

    
}
- (IBAction)textFieldDidChange:(UITextField *)sender {
    [self updateSplitCost];

}


- (void)updateSplitCost {
    float splitCostFloat = [self.totalCostTextField.text floatValue] / (self.slider.value +2) ;
    NSString *splitCostString = [NSString stringWithFormat:@"$%.02f", splitCostFloat];
    self.splitCostTextField.text = splitCostString;
}

- (IBAction)valueChanged:(UISlider*)sender {

    NSUInteger index = (self.slider.value + 0.9);
    [self.slider setValue:index animated:NO];
    self.sliderValueLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)index+2];
    
    [self updateSplitCost];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.text = @"";
    [self updateSplitCost];
    
}

    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
