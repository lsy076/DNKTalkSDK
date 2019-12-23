//
//  ViewController.m
//  DNKTalkSDKTestDemo
//
//  Created by dnake_ay on 2019/7/4.
//  Copyright © 2019 dnake_ay. All rights reserved.
//

#import "ViewController.h"
#import "IncomingViewController.h"
#import "MonitorVideoViewController.h"
#import <MBProgressHUD.h>

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *sipServiceTextField;
@property (weak, nonatomic) IBOutlet UITextField *sipAccountTextField;
@property (weak, nonatomic) IBOutlet UITextField *sipPasswordTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithTitle:@"离线" style:UIBarButtonItemStyleDone target:self action:nil];
    
    self.sipServiceTextField.text = SIP_SERVICE;
    self.sipAccountTextField.text = SIP_ACCOUNT;
    self.sipPasswordTextField.text = SIP_PASSWORD;
    //监听sip状态
    [[DNKTalkManager sharedInstance] setSipStatusBlock:^(int status) {
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithTitle:status == 1 ? @"在线" : @"离线" style:UIBarButtonItemStyleDone target:self action:nil];
    }];
    
    /*------------------------ 蓝牙开锁回调 ------------------------*/
    
    //蓝牙开锁回调
    [[DNKTalkManager sharedInstance] setBleUnlockBlock:^(NSNumber * _Nonnull unlockStatus) {
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        switch (unlockStatus.integerValue) {
            case 0:
            {
                //开锁失败
            }
                break;
            case 1:
            {
                //开锁成功
            }
                break;
                
            default:
                break;
        }
    }];
    //未找到开锁的蓝牙设备（搜索设备超时：3秒）
    [[DNKTalkManager sharedInstance] setNotFoundBleDeviceBlock:^{
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
    //蓝牙未开启
    [[DNKTalkManager sharedInstance] setStateOffBlock:^{
        NSLog(@"蓝牙未开启");
    }];
    
    //连接蓝牙log（type：类型， name：蓝牙名称， errorDesc：是否有报错）
    [[DNKTalkManager sharedInstance] setConnectLogBlock:^(BLE_CALLBACK type, NSString * _Nonnull name, NSString * _Nonnull errorDesc) {
        
        NSLog(@"bleUnlockManager - %lu-%@-%@", (unsigned long)type, name, errorDesc);
        
        switch (type) {
            case BLE_CALLBACK_SCAN_FOUND:
            {
                
            }
                break;
            case BLE_CALLBACK_CONNECT_FAIL:
            {
                
            }
                break;
            case BLE_CALLBACK_CONNECT_SUCCESS:
            {
                
            }
                break;
            case BLE_CALLBACK_SCAN_SERVICE:
            {
                
            }
                break;
            case BLE_CALLBACK_DIS_CONNECT:
            {
                
            }
                break;
                
            default:
                break;
        }
    }];
    
}
//sip这册
- (IBAction)registerSipMethod {
    
    SipConfigEntity *sipConfigEntity = [SipConfigEntity new];

    sipConfigEntity.node = self.sipServiceTextField.text;
    sipConfigEntity.user = self.sipAccountTextField.text;
    sipConfigEntity.passwd = self.sipPasswordTextField.text;

    [[DNKTalkManager sharedInstance] setSipConfigWithSipConfigEntity:sipConfigEntity];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%@", sipConfigEntity);
    });
    
}
//监视
- (IBAction)monitorVideoMethod {
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[MonitorVideoViewController new]];
    
    [self presentViewController:nav animated:YES completion:nil];
    
}
//开锁
- (IBAction)unLockMethod {
    
    [[DNKTalkManager sharedInstance] unLockWithSipAccount:SIP_DEVICE_CODE];
    
}
//蓝牙开锁
- (IBAction)bleUnlockMethod {
    
    NSArray *array = @[BLE_UNLOCK_MAC_ADDRESS1, BLE_UNLOCK_MAC_ADDRESS2];
    
    [[DNKTalkManager sharedInstance] bleUnlockWithMacAddresses:array];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

#pragma mark - 回收键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}
//点击屏幕空白处去掉键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}



@end
