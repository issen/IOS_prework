//
//  TipViewController.m
//  Tip
//
//  Created by Issen Su on 6/11/15.
//  Copyright (c) 2015 Issen Su. All rights reserved.
//

#import "TipViewController.h"
#import "SettingViewController.h"


@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *BillTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void) updateValues;
- (void) onSettingsButton;
- (void) loadDefaultConfig;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (self) {
        self.title = @"Tip Calculator";
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    [self updateValues];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"test");
    [self loadDefaultConfig];
    [self updateValues];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) updateValues {
    float billAmount = [self.BillTextField.text floatValue];
    
    NSArray *tipValues = @[ @(0.1), @(0.15),@(0.2)];
    
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
    
    
}

- (void) onSettingsButton {
    [self.navigationController pushViewController:[[SettingViewController alloc] init] animated:YES];
}

- (void) loadDefaultConfig {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"%d", (int)[defaults integerForKey:@"defaultTipSegmentIndex"]);
    [self.tipControl setSelectedSegmentIndex:[defaults integerForKey:@"defaultTipSegmentIndex"]];
}

@end
