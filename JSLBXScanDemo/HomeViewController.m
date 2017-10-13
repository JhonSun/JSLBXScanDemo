//
//  ViewController.m
//  JSLBXScanDemo
//
//  Created by lianditech on 2017/10/12.
//  Copyright © 2017年 lianditech. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction
- (IBAction)nativeScanAction:(UIButton *)sender {
    [self performSegueWithIdentifier:@"scanSegueIdf" sender:nil];
}

- (IBAction)zbarScanAction:(UIButton *)sender {
}

- (IBAction)zxingScanAction:(UIButton *)sender {
}

#pragma mark - navi
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"scanSegueIdf"]) {
        
    }
}

@end
