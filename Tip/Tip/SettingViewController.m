//
//  SettingViewController.m
//  Tip
//
//  Created by Issen Su on 6/11/15.
//  Copyright (c) 2015 Issen Su. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipController;
- (IBAction)setDefaultTip:(id)sender;


@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadDefaultConfig];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)setDefaultTip:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.tipController.selectedSegmentIndex forKey:@"defaultTipSegmentIndex"];
     NSLog(@"%d", (int)[defaults integerForKey:@"defaultTipSegmentIndex"]);
    [defaults synchronize];
}

- (void) loadDefaultConfig {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"%d", (int)[defaults integerForKey:@"defaultTipSegmentIndex"]);
    [self.tipController setSelectedSegmentIndex:[defaults integerForKey:@"defaultTipSegmentIndex"]];
}


@end
