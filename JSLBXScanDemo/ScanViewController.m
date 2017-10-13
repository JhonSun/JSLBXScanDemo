//
//  ScanViewController.m
//  JSLBXScanDemo
//
//  Created by lianditech on 2017/10/13.
//  Copyright © 2017年 lianditech. All rights reserved.
//

#import "ScanViewController.h"
#import "LBXScanNative.h"
#import "LBXScanView.h"

@interface ScanViewController ()

@property (nonatomic, strong) LBXScanViewStyle *scanViewStyle;
@property (nonatomic, strong) LBXScanView *scanView;
@property (nonatomic, strong) LBXScanNative *scanNative;

@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.scanView];
    [self.view sendSubviewToBack:self.scanView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.scanView stopDeviceReadying];
    [self.scanView startScanAnimation];
    [self.scanNative startScan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction
- (IBAction)turnOnOffTorchAction:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    [self.scanNative setTorch:sender.isSelected];
    if (sender.isSelected) {
        [sender setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_scan_off@2x.png"] forState:UIControlStateNormal];
    } else {
        [sender setImage:[UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_btn_flash_nor@2x.png"] forState:UIControlStateNormal];
    }
}

#pragma mark - lazy
- (LBXScanViewStyle *)scanViewStyle {
    if (!_scanViewStyle) {
        _scanViewStyle = [[LBXScanViewStyle alloc] init];
        _scanViewStyle.animationImage = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green@2x.png"];
    }
    return _scanViewStyle;
}

- (LBXScanView *)scanView {
    if (!_scanView) {
        _scanView = [[LBXScanView alloc] initWithFrame:self.view.bounds style:self.scanViewStyle];
        [_scanView startDeviceReadyingWithText:@"相机启动中"];
    }
    return _scanView;
}

- (LBXScanNative *)scanNative {
    if (!_scanNative) {
        __weak typeof(self) weakSelf = self;
        _scanNative = [[LBXScanNative alloc] initWithPreView:self.view ObjectType:nil cropRect:[LBXScanView getScanRectWithPreView:self.view style:self.scanViewStyle] success:^(NSArray<LBXScanResult *> *array) {
            [weakSelf.scanNative stopScan];
            [weakSelf.scanView stopScanAnimation];
            for (LBXScanResult *scanResult in array) {
                NSLog(@"扫描结果：%@", scanResult.strScanned);
            }
        }];
    }
    return _scanNative;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
